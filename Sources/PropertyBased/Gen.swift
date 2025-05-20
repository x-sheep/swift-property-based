//
//  Gen.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 18/05/2025.
//

/// A namespace for simple generator functions.
public enum Gen<Value> {}

extension Gen where Value: Sendable {
    /// Produces a generator that always returns the same, constant value.
    ///
    /// - Parameter value: A constant value.
    /// - Returns: A generator of a constant value.
    @inlinable
    public static func always(_ value: Value) -> Generator<Value, Shrink.None<Value>> {
        return Generator { _ in value }
    }
}

extension Gen where Value == Bool {
    /// A generator of random boolean values.
    public static var bool: Generator<Bool, Repeated<Bool>> { bool() }
    
    /// Create a generator of random boolean values with a specific rate.
    /// - Parameter rate: The rate of `true` values. Must be a number between 0 and 1.
    /// - Returns: A generator of random boolean values.
    public static func bool(_ rate: Float = 0.5) -> Generator<Bool, Repeated<Bool>> {
        Generator(
            run: { rng in Float.random(in: 0..<1, using: &rng) < rate },
            shrink: { wasTrue in repeatElement(false, count: wasTrue ? 1 : 0) }
        )
    }
}
