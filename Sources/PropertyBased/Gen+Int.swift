// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: FixedWidthInteger & Sendable {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable
    public static func value(in range: ClosedRange<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }
    
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable
    public static func value(in range: some RangeExpression<Value>) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> {
        return value(in: ClosedRange(range))
    }
}

extension Gen where Value == Int {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == Int8 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int8(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == Int16 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int16(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == Int32 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int32(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == Int64 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int64(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}

extension Gen where Value == UInt {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == UInt8 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint8(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == UInt16 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint16(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == UInt32 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint32(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
extension Gen where Value == UInt64 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint64(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension Gen where Value == Int128 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int128(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension Gen where Value == UInt128 {
    /// Returns a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint128(in range: some RangeExpression<Value> = Value.min ... Value.max) -> Generator<Value, Shrink.IntegralShrinkSequence<Value>> { value(in: range) }
}
