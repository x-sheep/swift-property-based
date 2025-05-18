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

extension Generator where Value: Collection & Sendable {
    /// Produces a generator of random elements of this generator's collection.
    @inlinable
    public var element: Generator<Value.Element?, Shrink.None<Value.Element?>> {
        return flatMap { value, _ in
                .init(run: { rng in
                    value.randomElement(using: &rng)
                })
        }
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
    /// Produces a new generator of collections of this generator's values.
    ///
    /// - Parameter count: The size of the random collection.
    /// - Returns: A generator of collections.
    @inlinable
    public func collection<C>(of count: Generator<Int, some Sequence<Int>>) -> Generator<C, some Sequence<C>>
    where C: RangeReplaceableCollection, C.Element == Value {
        return count.flatMap { count, _ in
            return .init { rng in
                var collection = C()
                var shrinkers: [ShrinkSequence] = []
                
                guard count > 0 else { return collection }
                collection.reserveCapacity(count)
                for _ in 1...count {
                    let (value, shrink) = self.run(using: &rng)
                    collection.append(value)
                    shrinkers.append(shrink)
                }
                return collection
            }
        }
    }
    
    /// Produces a new generator of arrays of this generator's values.
    ///
    /// - Parameter count: The size of the random array.
    /// - Returns: A generator of arrays.
    @inlinable
    public func array(of count: Generator<Int, some Sequence<Int>>) -> Generator<[Value], some Sequence<[Value]>> {
        return collection(of: count)
    }
    
    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// - Parameter count: The size of the random dictionary.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K: Hashable, V>(ofAtMost count: Generator<Int, some Sequence<Int>>) -> Generator<[K: V], some Sequence<[K: V]>> where Value == (K, V) {
        return count.flatMap { count, _ in
            return .init { rng in
                var dictionary: [K: V] = [:]
                dictionary.reserveCapacity(count)
                for _ in 1...count {
                    let (k, v) = self._run(&rng).value
                    dictionary[k] = v
                }
                return (dictionary, Shrink.omitSingleElement(from: dictionary))
            }
        }
    }
    
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set<S>(ofAtMost count: Generator<Int, some Sequence<Int>>) -> Generator<S, Shrink.None<S>> where S: SetAlgebra, S.Element == Value {
        return count.flatMap { count, _ in
            return .init { rng in
                var set = S()
                for _ in 1...count {
                    set.insert(self._run(&rng).value)
                }
                return set
            }
        }
    }
}

extension Generator where Value: Hashable {
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: Generator<Int, some Sequence<Int>>) -> Generator<Set<Value>, some Sequence<Set<Value>>> {
        return count.flatMap { count, _ in
            return .init { rng in
                var set: Set<Value> = []
                for _ in 1...count {
                    set.insert(self._run(&rng).value)
                }
                return set
            }
        }
    }
}
