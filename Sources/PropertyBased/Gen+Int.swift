// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value: FixedWidthInteger & Sendable {
    /// Produces a generator of random values within the specified range.
    ///
    /// ### Example
    /// ```swift
    /// Gen<UInt>.value(in: 0 ... 255)
    /// ```
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func value(in range: ClosedRange<Value> = Value.min...Value.max) -> Generator<
        Value, Shrink.Integer<Value>
    > {
        return .init(
            run: { rng in Value.random(in: range, using: &rng) },
            shrink: { $0.shrink(within: range) }
        )
    }

    /// Produces a generator of random values within the specified range.
    ///
    /// ### Example
    /// ```swift
    /// Gen<Int8>.value(in: 0...)
    /// ```
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random values within the bounds of range.
    @inlinable
    public static func value(in range: some RangeExpression<Value>) -> Generator<Value, Shrink.Integer<Value>> {
        return value(in: ClosedRange(range))
    }

    /// A generator of random integers within the full range, to be used for option sets.
    ///
    /// The associated shrinker will remove every bit, but will never set bits that are unset in the original value.
    @inlinable
    public static var bitSet: Generator<Value, Shrink.Bitwise<Value>> {
        return .init(
            run: { rng in Value.random(in: .min ... .max, using: &rng) },
            shrink: { .init($0) }
        )
    }
}

extension Gen where Value == Int {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int(in range: some RangeExpression<Int> = .min ... .max) -> Generator<
        Int, Shrink.Integer<Int>
    > { value(in: range) }
}
extension Gen where Value == Int8 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int8(in range: some RangeExpression<Int8> = .min ... .max) -> Generator<
        Int8, Shrink.Integer<Int8>
    > { value(in: range) }
}
extension Gen where Value == Int16 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int16(in range: some RangeExpression<Int16> = .min ... .max) -> Generator<
        Int16, Shrink.Integer<Int16>
    > { value(in: range) }
}
extension Gen where Value == Int32 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int32(in range: some RangeExpression<Int32> = .min ... .max) -> Generator<
        Int32, Shrink.Integer<Int32>
    > { value(in: range) }
}
extension Gen where Value == Int64 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int64(in range: some RangeExpression<Int64> = .min ... .max) -> Generator<
        Int64, Shrink.Integer<Int64>
    > { value(in: range) }
}

extension Gen where Value == UInt {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint(in range: some RangeExpression<UInt> = .min ... .max) -> Generator<
        UInt, Shrink.Integer<UInt>
    > { value(in: range) }
}
extension Gen where Value == UInt8 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint8(in range: some RangeExpression<UInt8> = .min ... .max) -> Generator<
        UInt8, Shrink.Integer<UInt8>
    > { value(in: range) }
}
extension Gen where Value == UInt16 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint16(in range: some RangeExpression<UInt16> = .min ... .max) -> Generator<
        UInt16, Shrink.Integer<UInt16>
    > { value(in: range) }
}
extension Gen where Value == UInt32 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint32(in range: some RangeExpression<UInt32> = .min ... .max) -> Generator<
        UInt32, Shrink.Integer<UInt32>
    > { value(in: range) }
}
extension Gen where Value == UInt64 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint64(in range: some RangeExpression<UInt64> = .min ... .max) -> Generator<
        UInt64, Shrink.Integer<UInt64>
    > { value(in: range) }
}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension Gen where Value == Int128 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func int128(in range: some RangeExpression<Int128> = .min ... .max) -> Generator<
        Int128, Shrink.Integer<Int128>
    > { value(in: range) }
}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension Gen where Value == UInt128 {
    /// Produces a generator of random integers within the specified range.
    ///
    /// - Parameter range: The range in which to create a random value.
    /// - Returns: A generator of random integers within the bounds of range.
    @inlinable public static func uint128(in range: some RangeExpression<UInt128> = .min ... .max) -> Generator<
        UInt128, Shrink.Integer<UInt128>
    > { value(in: range) }
}
