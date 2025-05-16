// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: BinaryFloatingPoint & Sendable, Value.RawSignificand: FixedWidthInteger {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in Value.random(in: range, using: &rng) }
    }
}

extension Gen where Value == Double {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func double(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == Float {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float32(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
extension Gen where Value == Float80 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float80(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}
#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension Gen where Value == CGFloat {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func cgFloat(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}
#endif
