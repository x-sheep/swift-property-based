//
//  Xoshiro+SeededRandomNumberGenerator.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Gen
import Foundation

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
}
