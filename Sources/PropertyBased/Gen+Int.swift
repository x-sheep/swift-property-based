// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: FixedWidthInteger & Sendable {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in Value.random(in: range, using: &rng) }
    }
}

extension Gen where Value == Int {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == Int8 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int8(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == Int16 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int16(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == Int32 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int32(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == Int64 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int64(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == UInt {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func uint(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == UInt8 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func uint8(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == UInt16 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func uint16(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == UInt32 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func uint32(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}

extension Gen where Value == UInt64 {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func uint64(in range: ClosedRange<Value>) -> Gen {
        return Gen { rng in .random(in: range, using: &rng) }
    }
}
