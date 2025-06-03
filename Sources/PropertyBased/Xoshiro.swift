// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

/// Pseudo-random generator.
///
/// The algorithm used is `xoshiro256**`: http://xoshiro.di.unimi.it.
public struct Xoshiro: RandomNumberGenerator, Sendable {
    @usableFromInline var state: (UInt64, UInt64, UInt64, UInt64)

    public var currentState: (UInt64, UInt64, UInt64, UInt64) { state }

    @inlinable
    public init() {
        var rng = SystemRandomNumberGenerator()
        self.state = (rng.next(), rng.next(), rng.next(), rng.next())
    }

    @inlinable
    public init(seed: (UInt64, UInt64, UInt64, UInt64)) {
        self.state = seed
    }

    @inlinable
    public mutating func next() -> UInt64 {
        // Adopted from https://github.com/mattgallagher/CwlUtils/blob/0bfc4587d01cfc796b6c7e118fc631333dd8ab33/Sources/CwlUtils/CwlRandom.swift
        let x = self.state.1 &* 5
        let result = ((x &<< 7) | (x &>> 57)) &* 9
        let t = self.state.1 &<< 17
        self.state.2 ^= self.state.0
        self.state.3 ^= self.state.1
        self.state.1 ^= self.state.2
        self.state.0 ^= self.state.3
        self.state.2 ^= t
        self.state.3 = (self.state.3 &<< 45) | (self.state.3 &>> 19)
        return result
    }
}

extension Xoshiro: Hashable {
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

        self.init(seed: state)
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
