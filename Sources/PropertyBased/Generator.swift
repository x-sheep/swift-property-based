// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

/// A composable, transformable context for generating random values.
///
/// A shrinking sequence must contain values that are closer than the input value to a specific bound. This bound should be the same for every call to this function, but it doesn't need to use the same ordering used by the `Comparable` protocol. For example: An integer that represents a year could be shrunk by moving it closer to the current year, instead of closer to zero.
///
/// When the property checker finds a failing input for a specific check, it will use a shrinking sequence to find another failing input. It will stop iterating the sequence as soon as a value is found that also causes a check failure. The Shrinker function is then called again with the lower input to get another sequence.
///
/// > Tip: For optimal performance, it's recommended that a shrinking sequence orders the values from most shrunk to least shrunk.
///
/// > Important: The sequence must _not_ contain the input value, or return any value that is further away from the bound than the input. The property checker may cause an infinite loop if this happens.
/// >
/// > An infinite loop can also happen if the bound changes between calls to the same Shrinker function, e.g. it contains an uncached read of the current system time.
public struct Generator<ResultValue, ShrinkSequence: Sequence>: Sendable {
    public typealias InputValue = ShrinkSequence.Element
    
    @usableFromInline
    internal typealias GenResult = (value: InputValue, shrink: (InputValue) -> ShrinkSequence)
    
    @usableFromInline
    internal var _run: @Sendable (inout any SeededRandomNumberGenerator) -> sending GenResult
    
    @usableFromInline
    internal var _finalResult: @Sendable (InputValue) -> ResultValue?
    
    /// Returns a random value.
    ///
    /// - Parameter rng: A random number generator.
    /// - Returns: A random value.
    @inlinable
    internal func run<G: SeededRandomNumberGenerator>(using rng: inout G) -> sending (gen: GenResult, result: ResultValue) {
        var arng: any SeededRandomNumberGenerator = rng
        defer { rng = arng as! G }
        
        while true {
            let run = _run(&arng)
            
            if let ret = _finalResult(run.value) {
                return (run, ret)
            }
        }
    }
}

extension Generator {
    /// Remove the shrinker for this generator.
    /// - Returns: A new generator with the shrinking function removed.
    @_disfavoredOverload // Only to show warning for redundant calls
    public func withoutShrink() -> Generator<ResultValue, Shrink.None<InputValue>> {
        .init(runWithShrink: { rng in
            (self._run(&rng).value, { _ in .init() })
        }, finalResult: self._finalResult)
    }
    
    @inlinable
    @_documentation(visibility: private)
    @available(*, deprecated, message: "This generator already has no shrinker.")
    public func withoutShrink<T>() -> Generator<ResultValue, Shrink.None<T>> where ShrinkSequence == Shrink.None<T> { self }
}

extension Generator where InputValue == ResultValue {
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending InputValue,
        shrink: @Sendable @escaping (InputValue) -> sending ShrinkSequence,
    ) {
        self._run = { rng in
            let value = run(&rng)
            return (value, { shrink($0) })
        }
        self._finalResult = { $0 }
    }
    
    @inlinable
    internal init(
        runWithShrink: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending GenResult
    ) {
        self._run = runWithShrink
        self._finalResult = { $0 }
    }
}

extension Generator {
    @inlinable
    internal init(
        runWithShrink: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending GenResult,
        finalResult: @Sendable @escaping (InputValue) -> ResultValue?
    ) {
        self._run = runWithShrink
        self._finalResult = finalResult
    }
}

extension Generator where ShrinkSequence == Shrink.None<ResultValue> {
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending InputValue
    ) {
        self._run = { rng in
            (run(&rng), { _ in .init() })
        }
        self._finalResult = { $0 }
    }
}

extension Generator {
    /// Transforms a generator of `ResultValue`s into a generator of `NewValue`s by applying a transformation.
    ///
    /// - Parameter transform: A function that transforms `ResultValue`s into `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func map<NewValue>(_ transform: @Sendable @escaping (ResultValue) -> NewValue) -> Generator<NewValue, ShrinkSequence> {
        return .init(
            runWithShrink: _run, finalResult: {
                if let result = self._finalResult($0) {
                    return transform(result)
                }
                return nil
            }
        )
    }
    
    /// Transforms a generator of `ResultValue`s into a generator of `NewValue`s by applying a transformation.
    ///
    /// - Parameter transform: A function that transforms a 2-tuple into `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func map<NewValue, ItemA, ItemB>(_ transform: @Sendable @escaping (ItemA, ItemB) -> NewValue) -> Generator<NewValue, ShrinkSequence> where ResultValue == (ItemA, ItemB) {
        return .init(
            runWithShrink: _run, finalResult: {
                if let result = self._finalResult($0) {
                    return transform(result.0, result.1)
                }
                return nil
            }
        )
    }
    
    /// Returns a generator of the non-nil results of calling the given transformation with a value of the generator.
    ///
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns an optional value.
    /// - Returns: A generator of the non-nil results of calling the given transformation with a value of the generator.
    @inlinable
    public func compactMap<NewValue>(_ transform: @Sendable @escaping (ResultValue) -> NewValue?) -> Generator<NewValue, ShrinkSequence> {
        return .init(
            runWithShrink: _run, finalResult: {
                if let result = self._finalResult($0) {
                    return transform(result)
                }
                return nil
            }
        )
    }
    
    /// Produces a generator of values that match the predicate.
    ///
    /// - Parameter predicate: A predicate.
    /// - Returns: A generator of values that match the predicate.
    @inlinable
    public func filter(_ predicate: @Sendable @escaping (ResultValue) -> Bool) -> Generator<ResultValue, ShrinkSequence> {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}

extension Generator {
    /// Produces a new generator of optional values.
    @inlinable
    public var optional: Generator<ResultValue?, Shrink.WithNil<ShrinkSequence>> { optional() }
    
    /// Produces a new generator of optional values.
    /// - Parameter valueRate: The rate of not-`nil` values. Must be a number between 0 and 1.
    /// - Returns: A generator of optional values.
    public func optional(valueRate: Float = 0.75) -> Generator<ResultValue?, Shrink.WithNil<ShrinkSequence>> {
        return .init(runWithShrink: { rng in
            if Float.random(in: 0..<1, using: &rng) > valueRate {
                return (nil as InputValue?, { _ in Shrink.WithNil(nil) })
            }
            let (value, shrink) = self._run(&rng)
            return (value, {
                if let some = $0 {
                    Shrink.WithNil(shrink(some))
                } else {
                    Shrink.WithNil(nil)
                }
            })
        }, finalResult: {
            if let some = $0 {
                return self._finalResult(some)
            }
            return nil
        })
    }
    
    /// Produces a new generator of failable values.
    ///
    /// - Parameters:
    ///   - gen: The generator for failures.
    ///   - successRate: The rate of success values. Must be a number between 0 and 1.
    /// - Returns: A generator of failable values.
    @inlinable
    public func asResult<
        InFailure,
        FailSeq: Sequence<InFailure>,
        FailResult: Error,
    >(withFailure gen: Generator<FailResult, FailSeq>, successRate: Float = 0.75) -> Generator<Result<ResultValue, FailResult>, Shrink.Tuple<(InputValue, InFailure, Bool)>> where InputValue: Sendable {
        zip(self, gen, Gen.bool(successRate).withoutShrink())
            .map { success, failure, isSuccess in
                isSuccess ? .success(success) : .failure(failure)
            }
    }
}

extension Generator {
    @inlinable public func eraseToAnySequence() -> Generator<ResultValue, AnySequence<InputValue>> {
        return .init(
            runWithShrink: { rng in
                let (value, shrink) = self._run(&rng)
                return (value, { AnySequence(shrink($0)) })
            },
            finalResult: _finalResult
        )
    }
}
