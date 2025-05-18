// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: BinaryFloatingPoint & Sendable, Value.RawSignificand: FixedWidthInteger {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func float(in range: ClosedRange<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>, Value> {
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
    public static func float(in range: Range<Value>) -> Generator<Value, Shrink.FloatingPointShrinkSequence<Value>, Value> {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }
}
