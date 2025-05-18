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
public struct Generator<InputValue, ShrinkSequence: Sequence, ResultValue>: Sendable where ShrinkSequence.Element == InputValue {
    @usableFromInline
    internal typealias GenResult = (value: InputValue, shrink: ShrinkSequence)
    
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
            
            if let ret = _finalResult(_run(&arng).value) {
                return (run, ret)
            }
        }
    }
}

extension Generator where InputValue == ResultValue {
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending InputValue,
        shrink: @Sendable @escaping (InputValue) -> sending ShrinkSequence,
    ) {
        self._run = { rng in
            let value = run(&rng)
            return (value, shrink(value))
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

extension Generator where ShrinkSequence == Shrink.None<InputValue>, InputValue == ResultValue {
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending InputValue
    ) {
        self._run = { rng in
            (run(&rng), .init())
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
    public func map<NewValue>(_ transform: @Sendable @escaping (ResultValue) -> NewValue) -> Generator<InputValue, ShrinkSequence, NewValue> {
        return .init(
            runWithShrink: _run, finalResult: {
                if let result = self._finalResult($0) {
                    return transform(result)
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
    public func compactMap<NewValue>(_ transform: @Sendable @escaping (ResultValue) -> NewValue?) -> Generator<InputValue, ShrinkSequence, NewValue> {
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
    public func filter(_ predicate: @Sendable @escaping (ResultValue) -> Bool) -> Generator<InputValue, some Sequence<InputValue>, ResultValue> {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}

extension Generator {
    /// Produces a new generator of optional values.
    ///
    /// - Returns: A generator of optional values.
    @inlinable
    public var optional: Generator<InputValue?, Shrink.OptionalShrinkSequence<ShrinkSequence>, ResultValue?> {
        return .init(runWithShrink: { rng in
            if Int.random(in: 0..<4) == 0 {
                return (nil as InputValue?, Shrink.OptionalShrinkSequence(nil))
            }
            let (value, shrink) = self._run(&rng)
            return (value, Shrink.OptionalShrinkSequence(shrink))
        }, finalResult: {
            if let some = $0 {
                return self._finalResult(some)
            }
            return nil
        })
    }
    
    /// Produces a new generator of failable values.
    ///
    /// - Returns: A generator of failable values.
//    @inlinable
//    public func asResult<
//        Failure: Error,
//        FailSeq: Sequence<Failure>,
//        FailResult: Error,
//    >(withFailure gen: Generator<Failure, FailSeq, FailResult>) -> Generator<Result<InputValue, Failure>, AnySequence<Result<InputValue, Failure>>, Result<ResultValue, Failure>> where InputValue: Sendable {
//        return Gen<Result<Value, Failure>>.frequency(
//            (1, gen.map(Result.failure).eraseToAnySequence()),
//            (3, self.map(Result.success).eraseToAnySequence())
//        )
//    }
}

extension Generator {
    @inlinable public func eraseToAnySequence() -> Generator<InputValue, AnySequence<InputValue>, ResultValue> {
        return .init(
            runWithShrink: { rng in
                let (value, shrink) = self._run(&rng)
                return (value, AnySequence(shrink))
            },
            finalResult: _finalResult
        )
    }
}
