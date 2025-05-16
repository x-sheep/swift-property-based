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
    /// A shrinking sequence must contain values that are closer than the input value to a specific bound. This bound should be the same for every call to this function, but it doesn't need to use the same ordering used by the `Comparable` protocol. For example: An integer that represents a year could be shrunk by moving it closer to the current year, instead of closer to zero.
    ///
    /// When the property checker finds a failing input for a specific check, it will use a shrinking sequence to find another failing input. It will stop iterating the sequence as soon as a value is found that also causes a check failure. The Shrinker function is then called again with the lower input to get another sequence.
    ///
    /// > Tip: For optimal performance, it's recommended that a shrinking sequence orders the values from most shrunk to least shrunk.
    ///
    /// > Important: The sequence must _not_ contain the input value, or return any value that is further away from the bound than the input. The property checker may cause an infinite loop if this happens.
    /// >
    /// > An infinite loop can also happen if the bound changes between calls to the same Shrinker function, e.g. it contains an uncached read of the current system time.
    public typealias Shrinker<T, Seq: Sequence<T>> = @Sendable (T) -> Seq
    
    /// Used for generators that don't support shrinking.
    public typealias None = EmptyCollection
}
