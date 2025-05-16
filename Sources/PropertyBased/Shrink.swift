//
//  Shrink.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

/// A namespace for all shrinking functions and structures.
@frozen public enum Shrink {
    /// A function that returns a sequence of shrinking values based on an input.
    ///
    /// If a value can't be shrunk, this function returns an empty sequence.
    ///
    /// For optimal performance, it's recommended that a shrinking sequence orders the values from most shrunk to least shrunk.
    public typealias Shrinker<T, Seq: Sequence<T>> = @Sendable (T) -> Seq
}
