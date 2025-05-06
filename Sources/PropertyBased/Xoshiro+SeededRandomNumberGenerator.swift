//
//  Xoshiro+SeededRandomNumberGenerator.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Gen

extension Xoshiro: @retroactive @unchecked Sendable {}

extension Xoshiro: @retroactive Hashable {
    public static func == (lhs: Xoshiro, rhs: Xoshiro) -> Bool {
        lhs.currentState == rhs.currentState
    }
    
    public func hash(into hasher: inout Hasher) {
        currentState.0.hash(into: &hasher)
        currentState.1.hash(into: &hasher)
        currentState.2.hash(into: &hasher)
        currentState.3.hash(into: &hasher)
    }
}

extension Xoshiro: SeededRandomNumberGenerator {
    public typealias Seed = String
    
    public init?(seed: String) {
        guard seed.count == 32,
              let s1 = UInt64(seed.prefix(8), radix: 16),
              let s2 = UInt64(seed.dropFirst(8).prefix(8), radix: 16),
              let s3 = UInt64(seed.dropFirst(16).prefix(8), radix: 16),
              let s4 = UInt64(seed.dropFirst(24).prefix(8), radix: 16)
        else { return nil }
        
        self.init(state: (s1, s2, s3, s4))
    }
    
    public var currentSeed: String {
        String(format: "%.8x%.8x%.8x%.8x", currentState.0, currentState.1, currentState.2, currentState.3)
    }
}
