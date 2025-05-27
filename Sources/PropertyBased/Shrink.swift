//
//  Shrink.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

/// A namespace for all shrinking functions and structures.
@frozen public enum Shrink {
    
    /// Used for generators that don't support shrinking.
    @frozen public struct None<Element>: Sequence, IteratorProtocol, Sendable {
        
        /// Create an empty sequence.
        @inlinable public init() {}
        
        /// Always returns `nil`.
        @inlinable public func next() -> Element? { nil }
    }
}
