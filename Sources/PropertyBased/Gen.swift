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
public struct Gen<Value, ShrinkSequence: Sequence>: Sendable where ShrinkSequence.Element == Value {
    public typealias GenResult = (value: Value, shrink: ShrinkSequence)
    
    @usableFromInline
    internal var _run: @Sendable (inout any SeededRandomNumberGenerator) -> sending GenResult
    
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending Value,
        shrink: @Sendable @escaping (Value) -> sending ShrinkSequence,
    ) {
        self._run = { rng in
            let value = run(&rng)
            return (value, shrink(value))
        }
    }
    
    @inlinable
    public init(
        runWithShrink: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending GenResult
    ) {
        self._run = runWithShrink
    }
    
    /// Returns a random value.
    ///
    /// - Parameter rng: A random number generator.
    /// - Returns: A random value.
    @inlinable
    public func run<G: SeededRandomNumberGenerator>(using rng: inout G) -> sending GenResult {
        var arng: any SeededRandomNumberGenerator = rng
        defer { rng = arng as! G }
        return self._run(&arng)
    }
}

extension Gen where ShrinkSequence == Shrink.None<Value> {
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending Value
    ) {
        self._run = { rng in
            (run(&rng), .init())
        }
    }
}

extension Gen where Value: Sendable, ShrinkSequence == Shrink.None<Value> {
    /// Produces a generator that always returns the same, constant value.
    ///
    /// - Parameter value: A constant value.
    /// - Returns: A generator of a constant value.
    @inlinable
    public static func always(_ value: Value) -> Gen {
        return Gen { _ in value }
    }
}

extension Gen where Value: Sendable {
    /// Transforms a generator of `Value`s into a generator of `NewValue`s by applying a transformation.
    ///
    /// - Parameter transform: A function that transforms `Value`s into `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func map<NewValue>(_ transform: @Sendable @escaping (Value) -> NewValue) -> Gen<NewValue, some Sequence<NewValue>> {
        return .init(
            runWithShrink: { rng in
                let (value, shrink) = self._run(&rng)
                return (transform(value), shrink.lazy.map(transform))
            }
        )
    }
    
    @inlinable
    public func mapWithShrink<NewValue, NewSequence: Sequence<NewValue>>(_ transform: @Sendable @escaping (Value, ShrinkSequence) -> (NewValue, NewSequence)) -> Gen<NewValue, NewSequence> {
        return .init(
            runWithShrink: { rng in
                let (value, shrink) = self._run(&rng)
                return transform(value, shrink)
            }
        )
    }
}

/// Combines two generators into a single one.
///
/// - Parameters:
///   - a: A generator of `A`s.
///   - b: A generator of `B`s.
/// - Returns: A generator of `(A, B)` pairs.
@inlinable
public func zip<A, B>(_ a: Gen<A, some Sequence<A>>, _ b: Gen<B, some Sequence<B>>) -> Gen<(A, B), Shrink.TupleShrinkSequence<(A, B)>> {
    return .init(runWithShrink: { rng in
        let p1 = a._run(&rng)
        let p2 = b.run(using: &rng)
        let values = (p1.value, p2.value)
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: p1.shrink, p2.shrink))
    })
}

extension Gen {
    /// Transforms a generator of `Value`s into a generator of `NewValue`s by transforming a value into a generator of `NewValue`s.
    ///
    /// - Parameter transform: A function that transforms `Value`s into a generator of `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func flatMap<NewValue, NewShrinkSequence: Sequence<NewValue>>(_ transform: @Sendable @escaping (Value, ShrinkSequence) -> Gen<NewValue, NewShrinkSequence>) -> Gen<NewValue, NewShrinkSequence> {
        return .init(runWithShrink: { rng in
            let (value, shrink) = self._run(&rng)
            return transform(value, shrink)._run(&rng)
        })
    }
}

extension Gen where Value: Sendable {
    
    /// Returns a generator of the non-nil results of calling the given transformation with a value of the generator.
    ///
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns an optional value.
    /// - Returns: A generator of the non-nil results of calling the given transformation with a value of the generator.
    @inlinable
    public func compactMap<NewValue>(_ transform: @Sendable @escaping (Value) -> NewValue?) -> Gen<NewValue, some Sequence<NewValue>> {
        return .init { rng in
            while true {
                let (value, shrink) = self._run(&rng)
                if let newValue = transform(value) {
                    return (newValue, shrink.lazy.compactMap(transform))
                }
            }
        }
    }
    
    /// Produces a generator of values that match the predicate.
    ///
    /// - Parameter predicate: A predicate.
    /// - Returns: A generator of values that match the predicate.
    @inlinable
    public func filter(_ predicate: @Sendable @escaping (Value) -> Bool) -> Gen<Value, some Sequence<Value>> {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
    
    /// Uses a weighted distribution to randomly select one of the generators in the list.
    @inlinable
    public static func frequency(_ distribution: (Int, Gen)...) -> Gen {
        return frequency(distribution)
    }
    
    /// Uses a weighted distribution to randomly select one of the generators in the list.
    @inlinable
    public static func frequency(_ distribution: [(Int, Gen)]) -> Gen {
        precondition(!distribution.isEmpty, "At least one generator is required")
        
        let generators = distribution.flatMap { Array(repeating: $1, count: $0) }
        return Gen { rng in
            let gen = generators.randomElement(using: &rng)!
            return gen.run(using: &rng)
        }
    }
}

extension Gen where Value == Bool, ShrinkSequence == Repeated<Bool> {
    /// A generator of random boolean values.
    public static let bool = Gen(
        run: { rng in Bool.random(using: &rng) },
        shrink: { wasTrue in repeatElement(false, count: wasTrue ? 1 : 0) }
    )
}

extension Gen {
    /// Produces a new generator of optional values.
    ///
    /// - Returns: A generator of optional values.
    @inlinable
    public var optional: Gen<Value?, Shrink.OptionalShrinkSequence<ShrinkSequence>> {
        return flatMap { value, shrink in
                .init(runWithShrink: { rng in
                    if Int.random(in: 0..<4) == 0 {
                        return (nil as Value?, Shrink.OptionalShrinkSequence(nil))
                    }
                    let (value, shrink) = self._run(&rng)
                    return (value, Shrink.OptionalShrinkSequence(shrink))
                })
        }
    }
    
    /// Produces a new generator of failable values.
    ///
    /// - Returns: A generator of failable values.
    @inlinable
    public func asResult<
        Failure: Error,
        FailSeq: Sequence<Failure>
    >(withFailure gen: Gen<Failure, FailSeq>) -> Gen<Result<Value, Failure>, AnySequence<Result<Value, Failure>>> where Value: Sendable {
        return Gen<Result<Value, Failure>, AnySequence<Result<Value, Failure>>>.frequency(
            (1, gen.map(Result.failure).eraseToAnySequence()),
            (3, self.map(Result.success).eraseToAnySequence())
        )
    }
}

extension Gen where Value: Sendable {
    @inlinable public func eraseToAnySequence() -> Gen<Value, AnySequence<Value>> {
        mapWithShrink { value, shrink in
            (value, AnySequence(shrink))
        }
    }
}
