// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen {
    /// Produces a generator of random elements of this generator's collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func element<C>(of collection: C) -> Generator<Value, Shrink.None<Value>, Value> where C: Collection & Sendable, Value == C.Element? {
        return Generator { rng in collection.randomElement(using: &rng) }
    }
    
    /// Produces a generator of shuffled arrays of this generator's collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func shuffled<C>(_ collection: C) -> Generator<Value, Shrink.None<Value>, Value> where C: Collection & Sendable, Value == [C.Element] {
        return Generator { rng in collection.shuffled(using: &rng) }
    }
}

extension Generator where InputValue: Sendable, ResultValue: Collection & Sendable {
    /// Produces a generator of random elements of this generator's collection.
    @inlinable
    public var element: Generator<ResultValue.Element?, Shrink.None<ResultValue.Element?>, ResultValue.Element?> {
        return .init(run: { rng in
            let (_, value) = self.run(using: &rng)
            return value.randomElement(using: &rng)
        })
    }
}

extension Gen where Value: CaseIterable & Sendable, Value.AllCases: Sendable {
    /// Produces a generator of all case-iterable cases.
    @inlinable
    public static var `case`: Generator<Value, Shrink.None<Value>, Value> {
        return .init { rng in
            Value.allCases.randomElement(using: &rng)!
        }
    }
}

extension Generator {
    /// Produces a new generator of arrays of this generator's values.
    ///
    /// - Parameter count: The size of the random array.
    /// - Returns: A generator of arrays.
    @inlinable
    public func array(of count: ClosedRange<Int>) -> Generator<[ResultValue], some Sequence<[ResultValue]>, [ResultValue]> {
        return .init(runWithShrink: { rng in
            let itemCount = Int.random(in: count, using: &rng)
            
            var collection: [ResultValue] = []
            
            guard itemCount > 0 else {
                return (collection, { Shrink.omitSingleElement(from: $0) })
            }
            collection.reserveCapacity(itemCount)
            for _ in 1...itemCount {
                // FIXME: run the compactMap here instead, so the shrinker is guaranteed to work
                let (_, result) = self.run(using: &rng)
                collection.append(result)
            }
            // TODO: use full array shrinker
            return (collection, { Shrink.omitSingleElement(from: $0, lowerBound: count.lowerBound) })
        })
    }
    
    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// - Parameter count: The size of the random dictionary.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K: Hashable, V>(ofAtMost count: ClosedRange<Int>) -> Generator<[(K, V)], some Sequence<[(K, V)]>, [K: V]> where ResultValue == (K, V) {
        return array(of: count).map {
            Dictionary($0, uniquingKeysWith: { a, _ in a })
        }
    }
    
    
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set<S>(ofAtMost count: ClosedRange<Int>) -> Generator<[ResultValue], some Sequence<[ResultValue]>, S> where S: SetAlgebra, S.Element == ResultValue {
        return array(of: count).map { S($0) }
    }
}

extension Generator where ResultValue: Hashable {
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: ClosedRange<Int>) -> Generator<[ResultValue], some Sequence<[ResultValue]>, Set<ResultValue>> {
        return array(of: count).map { Set($0) }
    }
}
