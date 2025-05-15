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

extension Xoshiro {
    public init(seed: (UInt64, UInt64, UInt64, UInt64)) {
        self.init(state: seed)
    }
}

#if canImport(Foundation)
import Foundation

extension Xoshiro: SeededRandomNumberGenerator {
    public typealias Seed = String
    
    public init?(seed: String) {
        guard let data = Data(base64Encoded: seed),
              data.count == MemoryLayout<UInt64>.size * 4
        else { return nil }
        
        let state = data.withUnsafeBytes {
            let pointer = $0.bindMemory(to: UInt64.self)
            return (pointer[0], pointer[1], pointer[2], pointer[3])
        }
        
        self.init(state: state)
    }
    
    public var currentSeed: String {
        let bytes: ContiguousArray = [currentState.0, currentState.1, currentState.2, currentState.3]
        let data = bytes.withUnsafeBufferPointer { Data(buffer: $0) }
        return data.base64EncodedString()
    }
    
    var traitHint: String {
        "(\"\(currentSeed)\")"
    }
}
#else
extension Xoshiro: SeededRandomNumberGenerator {
    public typealias Seed = (UInt64, UInt64, UInt64, UInt64)
    
    public var currentSeed: Seed { currentState }
    var traitHint: String { "\(currentState)" }
}
#endif
