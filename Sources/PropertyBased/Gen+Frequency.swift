//
//  Gen+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 18/05/2025.
//

extension Gen where Value: Sendable {
    
    /// Uses a weighted distribution to randomly select one of the generators in the list.
    @inlinable
    public static func frequency<Seq: Sequence<Value>>(_ distribution: (Int, Generator<Value, Seq>)...) -> Generator<Value, Seq> {
        return frequency(distribution)
    }
    
    /// Uses a weighted distribution to randomly select one of the generators in the list.
    @inlinable
    public static func frequency<Seq: Sequence<Value>>(_ distribution: [(Int, Generator<Value, Seq>)]) -> Generator<Value, Seq> {
        precondition(!distribution.isEmpty, "At least one generator is required")
        
        let generators = distribution.flatMap { Array(repeating: $1, count: $0) }
        return .init { rng in
            let gen = generators.randomElement(using: &rng)!
            return gen.run(using: &rng)
        }
    }
}
