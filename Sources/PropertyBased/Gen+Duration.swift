//
//  Gen+Duration.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 19/05/2025.
//

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
@usableFromInline let attosecondsPerSecond: Int128 = 1_000_000_000_000_000_000

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension Duration {
    /// An empty duration.
    @inlinable public static var zero: Self {
        .init(secondsComponent: 0, attosecondsComponent: 0)
    }
    
    @usableFromInline var int128: Int128 {
        Int128(self.components.attoseconds) + (Int128(self.components.seconds) * attosecondsPerSecond)
    }
    
    @usableFromInline init(_ int128: Int128) {
        self.init(secondsComponent: Int64(int128 / attosecondsPerSecond), attosecondsComponent: Int64(int128 % attosecondsPerSecond))
    }
}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension Gen where Value == Duration {
    /// Produces a generator of random durations within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random durations within the bounds of range.
    @inlinable public static func duration(in range: ClosedRange<Duration>) -> Generator<Duration, Shrink.Integer<Int128>> {
        let seconds = range.lowerBound.int128 ... range.upperBound.int128
        
        return Gen<Int128>.value(in: seconds).map { Duration($0) }
    }
}
