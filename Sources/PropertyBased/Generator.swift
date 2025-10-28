// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

#if compiler(>=6.2)
@_documentation(visibility: internal)
public typealias SendableSequenceType = Sequence & SendableMetatype
#else
@_documentation(visibility: internal)
public typealias SendableSequenceType = Sequence
#endif

/// A composable, transformable context for generating random values.
///
/// A Generator contains a specific function that creates new values, as well as a function
/// that builds a shrinking sequence for any value.
///
/// In most cases, the exact type of `ShrinkSequence` doesn't need to be public in your code, and the `some` keyword can be used instead.
/// ```swift
/// let gen = Generator<Output, some Sequence> = ...
/// ```
public struct Generator<ResultValue, ShrinkSequence: SendableSequenceType>: Sendable {
    public typealias InputValue = ShrinkSequence.Element

    /// Generate a single result, before mapping or filtering.
    @usableFromInline
    internal var _runIntermediate:
        @Sendable (inout any SeededRandomNumberGenerator, inout PropertyCheckProgress) -> sending InputValue

    /// Map an intermediate result to its final value, or return `nil` if the value should be filtered.
    @usableFromInline
    internal var _mapFilter: @Sendable (InputValue) -> ResultValue?

    @usableFromInline
    internal var _shrinker: @Sendable (InputValue) -> ShrinkSequence

    /// Run the generator until a single unfiltered value is found.
    @inlinable
    internal func runFull<G: SeededRandomNumberGenerator>(_ rng: inout G, _ progress: inout PropertyCheckProgress)
        -> sending (
            input: InputValue, result: ResultValue
        )
    {
        var arng: any SeededRandomNumberGenerator = rng
        defer { rng = arng as! G }

        while true {
            let run = _runIntermediate(&arng, &progress)

            if let ret = _mapFilter(run) {
                return (run, ret)
            } else {
                progress._rejected += 1
            }
        }
    }
}

extension Generator {
    /// Generate a single value.
    /// - Parameter rng: The random number generator to use.
    /// - Returns: A randomly generated value.
    public func run<G: SeededRandomNumberGenerator>(using rng: inout G) -> sending ResultValue {
        var progress = PropertyCheckProgress.one
        return runFull(&rng, &progress).result
    }

    /// Remove the shrinker for this generator.
    /// - Returns: A new generator with the shrinking function removed.
    @_disfavoredOverload  // Only to show warning for redundant calls
    public func withoutShrink() -> Generator<ResultValue, Shrink.None<InputValue>> {
        .init(
            run: _runIntermediate,
            shrink: { _ in .init() },
            finalResult: self._mapFilter
        )
    }

    @inlinable
    @_documentation(visibility: private)
    @available(*, deprecated, message: "This generator already has no shrinker.")
    public func withoutShrink<T>() -> Generator<ResultValue, Shrink.None<T>> where ShrinkSequence == Shrink.None<T> {
        self
    }
}

extension Generator where InputValue == ResultValue {
    /// Create a new generator with a shrinker.
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
    ///
    /// - Parameters:
    ///   - run: A block that returns a random value using a given random number generator.
    ///   - shrink: A function that returns a shrinking sequence from any input.
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending ResultValue,
        shrink: @Sendable @escaping (InputValue) -> sending ShrinkSequence,
    ) {
        self._runIntermediate = { rng, _ in run(&rng) }
        self._shrinker = shrink
        self._mapFilter = { $0 }
    }
    
    // TODO: docs
    @inlinable
    public static func sized(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator, inout PropertyCheckProgress) -> sending ResultValue,
        shrink: @Sendable @escaping (InputValue) -> sending ShrinkSequence,
    ) -> Self {
        .init(
            run: { rng, progress in run(&rng, &progress) },
            shrink: shrink,
            finalResult: { $0 }
        )
    }
}

extension Generator {
    @inlinable
    internal init(
        run:
            @Sendable @escaping (inout any SeededRandomNumberGenerator, inout PropertyCheckProgress) ->
            sending InputValue,
        shrink: @Sendable @escaping (InputValue) -> ShrinkSequence,
        finalResult: @Sendable @escaping (InputValue) -> ResultValue?
    ) {
        self._runIntermediate = run
        self._shrinker = shrink
        self._mapFilter = finalResult
    }
}

extension Generator where ShrinkSequence == Shrink.None<ResultValue> {
    /// Create a new generator without a shrinker.
    ///
    /// If you want to keep the shrinking functionality, consider using the `zip` function to combine several built-in generators.
    /// - Parameter run: A block that returns a random value using a given random number generator.
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending ResultValue
    ) {
        _runIntermediate = { rng, _ in run(&rng) }
        _shrinker = { _ in .init() }
        _mapFilter = { $0 }
    }
}

extension Generator {
    /// Transforms a generator of `ResultValue`s into a generator of `NewValue`s by applying a transformation.
    ///
    /// - Parameter transform: A function that transforms `ResultValue`s into `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func map<NewValue>(_ transform: @Sendable @escaping (ResultValue) -> NewValue) -> Generator<
        NewValue, ShrinkSequence
    > {
        return .init(
            run: _runIntermediate,
            shrink: _shrinker,
            finalResult: {
                if let result = self._mapFilter($0) {
                    return transform(result)
                }
                return nil
            }
        )
    }

    /// Transforms a generator of pairs into a generator of `NewValue`s by applying a transformation on both values.
    ///
    /// - Parameter transform: A function that transforms a 2-tuple into `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func map<NewValue, ItemA, ItemB>(_ transform: @Sendable @escaping (ItemA, ItemB) -> NewValue) -> Generator<
        NewValue, ShrinkSequence
    > where ResultValue == (ItemA, ItemB) {
        return .init(
            run: _runIntermediate,
            shrink: _shrinker,
            finalResult: {
                if let result = self._mapFilter($0) {
                    return transform(result.0, result.1)
                }
                return nil
            }
        )
    }

    /// Produces a generator of the non-nil results of calling the given transformation with a value of the generator.
    ///
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns an optional value.
    /// - Returns: A generator of the non-nil results of calling the given transformation with a value of the generator.
    @inlinable
    public func compactMap<NewValue>(_ transform: @Sendable @escaping (ResultValue) -> NewValue?) -> Generator<
        NewValue, ShrinkSequence
    > {
        return .init(
            run: _runIntermediate,
            shrink: _shrinker,
            finalResult: {
                if let result = self._mapFilter($0) {
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
    public func filter(_ predicate: @Sendable @escaping (ResultValue) -> Bool) -> Generator<ResultValue, ShrinkSequence>
    {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}

extension Generator {
    /// Produces a new generator of optional values.
    ///
    /// ## See Also
    ///
    /// - ``optional(valueRate:)``
    @inlinable
    public var optional: Generator<ResultValue?, Shrink.WithNil<ShrinkSequence>> { optional() }

    /// Produces a new generator of optional values.
    /// - Parameter valueRate: The rate of not-`nil` values. Must be a number between 0 and 1.
    /// - Returns: A generator of optional values.
    public func optional(valueRate: Float = 0.75) -> Generator<ResultValue?, Shrink.WithNil<ShrinkSequence>> {
        return .init(
            run: { rng, progress in
                if Float.random(in: 0..<1, using: &rng) >= valueRate {
                    return nil as InputValue?
                }
                return self.runFull(&rng, &progress).input
            },
            shrink: { value in
                if let value {
                    Shrink.WithNil(_shrinker(value))
                } else {
                    Shrink.WithNil(nil)
                }
            },
            finalResult: {
                if let some = $0 {
                    return self._mapFilter(some)
                }
                return .some(.none)
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
    >(withFailure gen: Generator<FailResult, FailSeq>, successRate: Float = 0.75) -> Generator<
        Result<ResultValue, FailResult>, Shrink.Tuple<(InputValue, InFailure, Bool)>
    > where InputValue: Sendable {
        zip(self, gen, Gen.bool(successRate).withoutShrink())
            .map { success, failure, isSuccess in
                isSuccess ? .success(success) : .failure(failure)
            }
    }
}

extension Generator {
    /// Wrap the shrinking sequence into an `AnySequence` struct.
    ///
    /// This can be used if multiple generators must have the exact same type.
    /// - Returns: A copy of this generator.
    @inlinable public func eraseToAnySequence() -> Generator<ResultValue, AnySequence<InputValue>> {
        return .init(
            run: _runIntermediate,
            shrink: { AnySequence(_shrinker($0)) },
            finalResult: _mapFilter
        )
    }

    /// Wrap the shrinking sequence into a type-erased `AnySequence` struct.
    ///
    /// This can be used if multiple generators must have the exact same type, and the underlying input value must also be hidden.
    /// - Returns: A copy of this generator.
    @inlinable public func eraseToAny() -> Generator<ResultValue, AnySequence<Any>> {
        return .init(
            run: { rng, progress in
                self._runIntermediate(&rng, &progress) as Any
            },
            shrink: {
                AnySequence(_shrinker($0 as! InputValue).lazy.map { $0 as Any })
            },
            finalResult: {
                self._mapFilter($0 as! InputValue)
            }
        )
    }
}

/// An object that contains the progress of a specific propertyCheck block.
///
/// The ``fraction`` property can be used to resize the random inputs, to gradually increase
/// the bounds of a Generator over the course of a test run.
@frozen public struct PropertyCheckProgress: Hashable, Sendable {
    internal init(completed: Int, rejected: Int, total: Int) {
        self.completed = completed
        self._rejected = rejected
        self.total = total
    }
    
    /// The amount of succesfully generated random values.
    ///
    /// This value will not exceed the `total` amount.
    public internal(set) var completed: Int
    
    @usableFromInline internal var _rejected: Int
    
    /// The amount of times that the test block will be executed.
    public internal(set) var total: Int

    /// A number between 0 exclusive and 1 inclusive that can be used to resize the random inputs.
    ///
    /// This number will gradually increase over the course of a test run, while taking the test duration and the Generator's filters into account.
    public var fraction: Float {
        // TODO: improve this formula by including the rejected count
        let f = Float(completed) / Float(total)
        return min(1, max(0.1, f * 2))
    }
    
    /// The amount of generated random values that were rejected by the Generator's filters.
    @inlinable public var rejected: Int { _rejected }

    static let one: Self = PropertyCheckProgress(completed: 0, rejected: 0, total: 1)
}

extension PropertyCheckProgress: Comparable {
    public static func < (lhs: PropertyCheckProgress, rhs: PropertyCheckProgress) -> Bool {
        lhs.fraction < rhs.fraction
    }

}
