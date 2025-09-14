// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

#if compiler(>=6.2)
@_documentation(visibility: internal)
public typealias SendableHashableType = Hashable & SendableMetatype
#else
@_documentation(visibility: internal)
public typealias SendableHashableType = Hashable
#endif

extension Gen {
    /// Produces a generator of random elements of the given collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func element<C>(of collection: C) -> Generator<Value, Shrink.None<Value>>
    where C: Collection & Sendable, Value == C.Element? {
        return Generator { rng in collection.randomElement(using: &rng) }
    }

    /// Produces a generator of shuffled arrays of the given collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func shuffled<C>(_ collection: C) -> Generator<Value, Shrink.None<Value>>
    where C: Collection & Sendable, Value == [C.Element] {
        return Generator { rng in collection.shuffled(using: &rng) }
    }
}

extension Generator where InputValue: Sendable, ResultValue: Collection & Sendable {
    /// Produces a generator of random elements of this generator's collection.
    @inlinable
    public var element: Generator<ResultValue.Element?, Shrink.None<ResultValue.Element?>> {
        return .init(run: { rng in
            let value = self.run(using: &rng)
            return value.randomElement(using: &rng)
        })
    }
}

extension Gen where Value: CaseIterable & Sendable, Value.AllCases: Sendable {
    /// Produces a generator of random cases of a given enum.
    ///
    /// The enum must conform to `CaseIterable`.
    ///
    /// ### Example
    /// ```swift
    /// enum Direction: CaseIterable {
    ///     case north, south, east, west
    /// }
    /// let gen = Gen<Direction>.case
    /// ```
    @inlinable
    public static var `case`: Generator<Value, Shrink.None<Value>> {
        precondition(!Value.allCases.isEmpty, "CaseIterable must have at least one case")
        return .init { rng in
            Value.allCases.randomElement(using: &rng)!
        }
    }
}

extension Generator {
    @_documentation(visibility: internal)
    public typealias ArrayShrink = Shrink.Appended<
        Shrink.Omit<[InputValue]>, Shrink.ElementWise<InputValue, [InputValue], ShrinkSequence>
    >

    /// Produces a new generator of arrays of this generator's values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.bool.array(of: 1 ... 10)
    /// ```
    ///
    /// - Parameter count: The size of the random array.
    /// - Returns: A generator of arrays.
    @inlinable
    public func array(of count: ClosedRange<Int>) -> Generator<[ResultValue], ArrayShrink> {
        return .init(
            run: { rng in
                let itemCount = Int.random(in: count, using: &rng)

                var collection: [InputValue] = []

                collection.reserveCapacity(itemCount)
                for _ in 0..<itemCount {
                    collection.append(self.runFull(&rng).input)
                }
                return collection
            },
            shrink: {
                Shrink.shrinkArray($0, shrinker: _shrinker, lowerBound: count.lowerBound)
            },
            finalResult: {
                return $0.compactMap(self._mapFilter)
            })
    }

    /// Produces a new generator of arrays of this generator's values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.bool.array(of: 5)
    /// ```
    ///
    /// - Parameter count: The size of the random array.
    /// - Returns: A generator of arrays.
    @inlinable
    public func array(of count: Int) -> Generator<[ResultValue], ArrayShrink> {
        return array(of: count...count)
    }

    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// ### Example
    /// ```swift
    /// zip(
    ///     Gen.int(),
    ///     Gen.letter.string(of: 10)
    /// ).dictionary(ofAtMost: 1 ... 10)
    /// ```
    ///
    /// - Parameter count: The size of the random dictionary. If duplicate keys are generated, the dictionary will have a smaller size.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K: SendableHashableType, V>(ofAtMost count: ClosedRange<Int>) -> Generator<
        [K: V], ArrayShrink
    >
    where ResultValue == (K, V) {
        return array(of: count).map {
            Dictionary($0, uniquingKeysWith: { a, _ in a })
        }
    }

    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// ### Example
    /// ```swift
    /// zip(
    ///     Gen.int(),
    ///     Gen.letter.string(of: 10)
    /// ).dictionary(ofAtMost: 5)
    /// ```
    ///
    /// - Parameter count: The size of the random dictionary. If duplicate keys are generated, the dictionary will have a smaller size.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K: SendableHashableType, V>(ofAtMost count: Int) -> Generator<[K: V], ArrayShrink>
    where ResultValue == (K, V) {
        return dictionary(ofAtMost: count...count)
    }
}

extension Generator where ResultValue: SendableHashableType {
    /// Produces a new generator of sets of this generator's values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.int().set(ofAtMost: 1 ... 10)
    /// ```
    ///
    /// - Parameter count: The amount of items to generate. If duplicate items are generated, the set will have a smaller size.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: ClosedRange<Int>) -> Generator<Set<ResultValue>, ArrayShrink> {
        return array(of: count).map { Set($0) }
    }

    /// Produces a new generator of sets of this generator's values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.int().set(ofAtMost: 5)
    /// ```
    ///
    /// - Parameter count: The amount of items to generate. If duplicate items are generated, the set will have a smaller size.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: Int) -> Generator<Set<ResultValue>, ArrayShrink> {
        return set(ofAtMost: count...count)
    }
}

extension Gen where Value: OptionSet & Sendable, Value.RawValue: FixedWidthInteger & Sendable {
    /// Produces a generator of sets for an OptionSet.
    ///
    /// This generator will generate sets that may exceed the static properties declared in this option set.
    /// To specify an upper limit, use ``optionSet(of:)``.
    ///
    /// ### Example
    /// ```swift
    /// struct Alignment: OptionSet {
    ///     var rawValue: UInt8
    ///
    ///     static let top = Self(rawValue: 1 << 0)
    ///     static let bottom = Self(rawValue: 1 << 1)
    ///     static let leading = Self(rawValue: 1 << 2)
    ///     static let trailing = Self(rawValue: 1 << 3)
    /// }
    /// let gen = Gen<Alignment>.optionSet
    /// ```
    /// ## See Also
    /// - ``optionSet(of:)``
    public static var optionSet: Generator<Value, Shrink.Bitwise<Value.RawValue>> {
        Gen<Value.RawValue>.bitSet.map { Value(rawValue: $0) }
    }

    /// Produces a generator of sets for an OptionSet.
    ///
    /// ### Example
    /// ```swift
    /// struct Alignment: OptionSet {
    ///     var rawValue: UInt8
    ///
    ///     static let top = Self(rawValue: 1 << 0)
    ///     static let bottom = Self(rawValue: 1 << 1)
    ///     static let leading = Self(rawValue: 1 << 2)
    ///     static let trailing = Self(rawValue: 1 << 3)
    ///     static let all: Self = [.top, .bottom, .leading, .trailing]
    /// }
    /// let gen = Gen.optionSet(of: Alignment.all)
    /// ```
    ///
    /// - Parameter options: The options to choose from.
    /// - Returns: A generator of option sets.
    public static func optionSet(of options: Value) -> Generator<Value, Shrink.Bitwise<Value.RawValue>> {
        Gen<Value.RawValue>.bitSet.map { Value(rawValue: $0 & options.rawValue) }
    }
}
