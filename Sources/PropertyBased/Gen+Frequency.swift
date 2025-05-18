//
//  Gen+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 18/05/2025.
//

extension Gen {
    
    /// Uses a weighted distribution to randomly select one of the generators in the list.
    @inlinable
    public static func frequency<InValue: Sendable, Seq: Sequence<InValue>>(_ distribution: (Int, Generator<InValue, Seq, Value>)...) -> Generator<InValue, Seq, Value> {
        return frequency(distribution)
    }
    
    /// Uses a weighted distribution to randomly select one of the generators in the list.
    @inlinable
    public static func frequency<InValue: Sendable, Seq: Sequence<InValue>>(_ distribution: [(Int, Generator<InValue, Seq, Value>)]) -> Generator<InValue, Seq, Value> {
        precondition(!distribution.isEmpty, "At least one generator is required")
        
        let generators = distribution.flatMap { Array(repeating: $1, count: $0) }
        let gen = Gen<[Generator<InValue, Seq, Value>]>.always(generators)
    }
}
