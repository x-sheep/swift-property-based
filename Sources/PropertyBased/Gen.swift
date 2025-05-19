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
    public static let bool = Generator(
        run: { rng in Bool.random(using: &rng) },
        shrink: { wasTrue in repeatElement(false, count: wasTrue ? 1 : 0) }
    )
}
