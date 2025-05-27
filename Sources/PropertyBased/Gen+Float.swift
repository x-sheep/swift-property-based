// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: BinaryFloatingPoint & Sendable, Value.RawSignificand: FixedWidthInteger {
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func value(in range: ClosedRange<Value>) -> Generator<Value, Shrink.Floating<Value>> {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }
    
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func value(in range: Range<Value>) -> Generator<Value, Shrink.Floating<Value>> {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }
}

extension Gen where Value == Float {
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float(in range: ClosedRange<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
    
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float(in range: Range<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
}

extension Gen where Value == Double {
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func double(in range: ClosedRange<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
    
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func double(in range: Range<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Gen where Value == Float16 {
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float16(in range: ClosedRange<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
    
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float16(in range: Range<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
}

#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
extension Gen where Value == Float80 {
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float80(in range: ClosedRange<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
    
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float80(in range: Range<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
}
#endif

#if canImport(Foundation)
import Foundation
extension Gen where Value == CGFloat {
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func cgFloat(in range: ClosedRange<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
    
    /// Produces a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func cgFloat(in range: Range<Value>) -> Generator<Value, Shrink.Floating<Value>> { return value(in: range) }
}
#endif
