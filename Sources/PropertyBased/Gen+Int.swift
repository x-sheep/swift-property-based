// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: FixedWidthInteger & Sendable {
    /// Returns a generator of random values within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value. `range` must be finite.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func int(in range: some RangeExpression<Value>) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> {
        let closedRange = ClosedRange(range)
        return .init(
            run: { rng in Value.random(in: closedRange, using: &rng) },
            shrink: { $0.shrink(within: closedRange) }
        )
    }
    
    /// Returns a generator of random values within the full range of the integer type.
    ///
    /// - Returns: A generator of random values.
    @inlinable
    public static func int() -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> {
        return int(in: Value.min ... Value.max)
    }
}
