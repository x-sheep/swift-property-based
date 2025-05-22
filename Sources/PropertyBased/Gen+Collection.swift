// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen {
    /// Produces a generator of random elements of this generator's collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func element<C>(of collection: C) -> Generator<Value, Shrink.None<Value>> where C: Collection & Sendable, Value == C.Element? {
        return Generator { rng in collection.randomElement(using: &rng) }
    }
    
    /// Produces a generator of shuffled arrays of this generator's collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func shuffled<C>(_ collection: C) -> Generator<Value, Shrink.None<Value>> where C: Collection & Sendable, Value == [C.Element] {
        return Generator { rng in collection.shuffled(using: &rng) }
    }
}

extension Generator where InputValue: Sendable, ResultValue: Collection & Sendable {
    /// Produces a generator of random elements of this generator's collection.
    @inlinable
    public var element: Generator<ResultValue.Element?, Shrink.None<ResultValue.Element?>> {
        return .init(run: { rng in
            let (_, value) = self.runFull(&rng)
            return value.randomElement(using: &rng)
        })
    }
}

extension Gen where Value: CaseIterable & Sendable, Value.AllCases: Sendable {
    /// Produces a generator of all case-iterable cases.
    @inlinable
    public static var `case`: Generator<Value, Shrink.None<Value>> {
        return .init { rng in
            Value.allCases.randomElement(using: &rng)!
        }
    }
}

extension Generator {
    @_documentation(visibility: internal)
    public typealias ArrayShrink = Shrink.Appended<Shrink.Omit<[InputValue]>, Shrink.ElementWise<InputValue, [InputValue], ShrinkSequence>>
    
    /// Produces a new generator of arrays of this generator's values.
    ///
    /// - Parameter count: The size of the random array.
    /// - Returns: A generator of arrays.
    @inlinable
    public func array(of count: ClosedRange<Int>) -> Generator<[ResultValue], ArrayShrink> {
        return .init(runWithShrink: { rng in
            let itemCount = Int.random(in: count, using: &rng)
            
            var collection: [InputValue] = []
            var shrinkers: [(InputValue) -> ShrinkSequence] = []
            
            guard itemCount > 0 else {
                return (collection, { Shrink.shrinkArray($0, shrinker: shrinkers) })
            }
            collection.reserveCapacity(itemCount)
            for _ in 1...itemCount {
                let gen = self.runFull(&rng).gen
                collection.append(gen.value)
                shrinkers.append(gen.shrink)
            }
            return (collection, { Shrink.shrinkArray($0, shrinker: shrinkers, lowerBound: count.lowerBound) })
        }, finalResult: {
            return $0.compactMap(self._mapFilter)
        })
    }
    
    /// Produces a new generator of arrays of this generator's values.
    ///
    /// - Parameter count: The size of the random array.
    /// - Returns: A generator of arrays.
    @inlinable
    public func array(of count: Int) -> Generator<[ResultValue], ArrayShrink> {
        return array(of: count...count)
    }
    
    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// - Parameter count: The size of the random dictionary.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K: Hashable, V>(ofAtMost count: ClosedRange<Int>) -> Generator<[K: V], ArrayShrink> where ResultValue == (K, V) {
        return array(of: count).map {
            Dictionary($0, uniquingKeysWith: { a, _ in a })
        }
    }
    
    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// - Parameter count: The size of the random dictionary.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K: Hashable, V>(ofAtMost count: Int) -> Generator<[K: V], ArrayShrink> where ResultValue == (K, V) {
        return dictionary(ofAtMost: count...count)
    }
    
    
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set<S>(ofAtMost count: ClosedRange<Int>) -> Generator<S, ArrayShrink> where S: SetAlgebra, S.Element == ResultValue {
        return array(of: count).map { S($0) }
    }
    
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set<S>(ofAtMost count: Int) -> Generator<S, ArrayShrink> where S: SetAlgebra, S.Element == ResultValue {
        return set(ofAtMost: count...count)
    }
}

extension Generator where ResultValue: Hashable {
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: ClosedRange<Int>) -> Generator<Set<ResultValue>, ArrayShrink> {
        return array(of: count).map { Set($0) }
    }
    
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: Int) -> Generator<Set<ResultValue>, ArrayShrink> {
        return set(ofAtMost: count...count)
    }
}
