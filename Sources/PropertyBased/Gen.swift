// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

/// A composable, transformable context for generating random values.
public struct Gen<Value>: Sendable {
    @usableFromInline
    internal var _run: @Sendable (inout any SeededRandomNumberGenerator) -> sending Value
    
    @inlinable
    public init(run: @Sendable @escaping (inout any SeededRandomNumberGenerator) -> sending Value) {
        self._run = run
    }
    
    /// Returns a random value.
    ///
    /// - Parameter rng: A random number generator.
    /// - Returns: A random value.
    @inlinable
    public func run<G: SeededRandomNumberGenerator>(using rng: inout G) -> sending Value {
        var arng: any SeededRandomNumberGenerator = rng
        defer { rng = arng as! G }
        return self._run(&arng)
    }
}

extension Gen where Value: Sendable {
    /// Produces a generator that always returns the same, constant value.
    ///
    /// - Parameter value: A constant value.
    /// - Returns: A generator of a constant value.
    @inlinable
    public static func always(_ value: Value) -> Gen {
        return Gen { _ in value }
    }
}

extension Gen {
    /// Transforms a generator of `Value`s into a generator of `NewValue`s by applying a transformation.
    ///
    /// - Parameter transform: A function that transforms `Value`s into `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func map<NewValue: Sendable>(_ transform: @Sendable @escaping (Value) -> NewValue) -> Gen<NewValue> {
        return Gen<NewValue> { rng in transform(self._run(&rng)) }
    }
}

/// Combines two generators into a single one.
///
/// - Parameters:
///   - a: A generator of `A`s.
///   - b: A generator of `B`s.
/// - Returns: A generator of `(A, B)` pairs.
@inlinable
public func zip<A, B>(_ a: Gen<A>, _ b: Gen<B>) -> Gen<(A, B)> {
    return Gen<(A, B)> { rng in
        (a._run(&rng), b._run(&rng))
    }
}

extension Gen {
    /// Transforms a generator of `Value`s into a generator of `NewValue`s by transforming a value into a generator of `NewValue`s.
    ///
    /// - Parameter transform: A function that transforms `Value`s into a generator of `NewValue`s.
    /// - Returns: A generator of `NewValue`s.
    @inlinable
    public func flatMap<NewValue>(_ transform: @Sendable @escaping (Value) -> Gen<NewValue>) -> Gen<NewValue> {
        return Gen<NewValue> { rng in
            transform(self._run(&rng))._run(&rng)
        }
    }
    
    /// Returns a generator of the non-nil results of calling the given transformation with a value of the generator.
    ///
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns an optional value.
    /// - Returns: A generator of the non-nil results of calling the given transformation with a value of the generator.
    @inlinable
    public func compactMap<NewValue>(_ transform: @Sendable @escaping (Value) -> NewValue?) -> Gen<NewValue> {
        return Gen<NewValue> { rng in
            while true {
                if let value = transform(self._run(&rng)) {
                    return value
                }
            }
        }
    }
    
    /// Produces a generator of values that match the predicate.
    ///
    /// - Parameter predicate: A predicate.
    /// - Returns: A generator of values that match the predicate.
    @inlinable
    public func filter(_ predicate: @Sendable @escaping (Value) -> Bool) -> Gen<Value> {
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
            Gen<Int>.int(in: 0...generators.count - 1)
                .flatMap { idx in generators[idx] }
                .run(using: &rng)
        }
    }
}

extension Gen where Value == Bool {
    /// A generator of random boolean values.
    public static let bool = Gen { rng in Bool.random(using: &rng) }
}

extension Gen {
    /// Produces a new generator of optional values.
    ///
    /// - Returns: A generator of optional values.
    @inlinable
    public var optional: Gen<Value?> {
        let parent = self
        return flatMap { rng in
            Gen<Value?> { rng in
                if Int.random(in: 0..<4) == 0 {
                    return nil
                }
                return parent._run(&rng)
            }
        }
    }
    
    /// Produces a new generator of failable values.
    ///
    /// - Returns: A generator of failable values.
    @inlinable
    public func asResult<Failure>(withFailure gen: Gen<Failure>) -> Gen<Result<Value, Failure>> where Value: Sendable {
        return Gen<Result<Value, Failure>>.frequency(
            (1, gen.map(Result.failure)),
            (3, self.map(Result.success))
        )
    }
}
