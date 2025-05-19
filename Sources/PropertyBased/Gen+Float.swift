// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: BinaryFloatingPoint & Sendable, Value.RawSignificand: FixedWidthInteger {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float(in range: ClosedRange<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }
    
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float(in range: Range<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }
}

extension Gen where Value == Double {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func double(in range: ClosedRange<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
    
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func double(in range: Range<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Gen where Value == Float16 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float16(in range: ClosedRange<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
    
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float16(in range: Range<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
}

#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
extension Gen where Value == Float80 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float80(in range: ClosedRange<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
    
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float80(in range: Range<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
}
#endif

#if canImport(Foundation)
import Foundation
extension Gen where Value == CGFloat {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func cgFloat(in range: ClosedRange<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
    
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func cgFloat(in range: Range<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>> { return float(in: range) }
}
#endif
