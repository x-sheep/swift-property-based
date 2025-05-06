//
//  SeededRandomNumberGenerator.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

/// A type that produces a sequence of pseudo-random values from a given seed.
///
/// Identical instances of this generator must generate the same sequence of values when repeatedly calling `next()`.
///
/// Re-using seeds across multiple executions of the program must result in the same same sequence of values, provided that the Swift library version and the program's dependencies remain unchanged.
public protocol SeededRandomNumberGenerator: RandomNumberGenerator, Hashable, Sendable {
    
    /// The type to use as the seed.
    associatedtype Seed: Hashable & Codable
    
    /// The current seed of the generator.
    ///
    /// Calling `next()` on this generator will change the current seed value.
    /// Creating a new instance of the generator with this seed must result in an instance identical to the current generator.
    var currentSeed: Seed { get }
    
    /// Create an instance of this generator with a given seed.
    ///
    /// If the seed is invalid or incomplete, this initializer returns `nil`.
    /// - Parameter seed: The seed to use.
    init?(seed: String)
    
    /// Create an instance of this generator with a seed provided by a high-quality random source.
    init()
}
