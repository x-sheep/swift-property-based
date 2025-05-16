// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

/// A composable, transformable context for generating random values.
public struct Gen<Value, ShrinkSequence: Sequence>: Sendable where ShrinkSequence.Element == Value {
    public typealias GenResult = (value: Value, shrink: Shrink.Shrinker<Value, ShrinkSequence>)
    
    @usableFromInline
    internal var _run: @Sendable (inout any SeededRandomNumberGenerator) -> sending GenResult
    
    @inlinable
    public init(
        run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending Value,
        shrink: @escaping Shrink.Shrinker<Value, ShrinkSequence>,
    ) {
        self._run = { rng in
            (run(&rng), shrink)
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
            (run(&rng), { _ in .init() })
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
                return (transform(value), { _ in
                    shrink(value).lazy.map(transform)
                })
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
//@inlinable
//public func zip<A, B>(_ a: Gen<A>, _ b: Gen<B>) -> Gen<(A, B)> {
//    return Gen<(A, B)> { rng in
//        (a._run(&rng), b._run(&rng))
//    }
//}

extension Gen {
    /// Transforms a generator of `Value`s into a generator of `NewValue`s by transforming a value into a generator of `NewValue`s.
    ///
    /// - Parameter transform: A function that transforms `Value`s into a generator of `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func flatMap<NewValue, NewShrinkSequence: Sequence<NewValue>>(_ transform: @Sendable @escaping (Value, @escaping Shrink.Shrinker<Value, ShrinkSequence>) -> Gen<NewValue, NewShrinkSequence>) -> Gen<NewValue, NewShrinkSequence> {
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
                    return (newValue, { _ in
                        shrink(value).lazy.compactMap(transform)
                    })
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
                        return (nil as Value?, { _ in Shrink.OptionalShrinkSequence(nil) })
                    }
                    let (value, shrink) = self._run(&rng)
                    return (value, { Shrink.OptionalShrinkSequence(shrink($0!)) })
                })
        }
    }
    
    /// Produces a new generator of failable values.
    ///
    /// - Returns: A generator of failable values.
//    @inlinable
//    public func asResult<Failure>(withFailure gen: Gen<Failure, any Sequence<Failure>>) -> Gen<Result<Value, Failure>, any Sequence> where Value: Sendable {
//        return Gen<Result<Value, Failure>>.frequency(
//            (1, gen.map(Result.failure)),
//            (3, self.map(Result.success))
//        )
//    }
}
