// Adapted from https://github.com/pointfreeco/swift-gen
// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen {
    /// Produces a generator of random elements of this generator's collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func element<C>(of collection: C) -> Gen where C: Collection & Sendable, Value == C.Element? {
        return Gen { rng in collection.randomElement(using: &rng) }
    }
    
    /// Produces a generator of shuffled arrays of this generator's collection.
    ///
    /// - Parameter collection: A collection.
    @inlinable
    public static func shuffled<C>(_ collection: C) -> Gen where C: Collection & Sendable, Value == [C.Element] {
        return Gen { rng in collection.shuffled(using: &rng) }
    }
}

extension Gen where Value: Collection & Sendable {
    /// Produces a generator of random elements of this generator's collection.
    @inlinable
    public var element: Gen<Value.Element?> {
        return self.flatMap(Gen<Value.Element?>.element)
    }
    
    /// Produces a generator of shuffled arrays of this generator's collection.
    @inlinable
    public var shuffled: Gen<[Value.Element]> {
        return self.flatMap(Gen<[Value.Element]>.shuffled)
    }
}

extension Gen where Value: CaseIterable & Sendable, Value.AllCases: Sendable {
    /// Produces a generator of all case-iterable cases.
    @inlinable
    public static var `case`: Gen<Value> {
        return Gen<Value.AllCases>.always(Value.allCases).element.map { $0! }
    }
}

extension Gen {
    /// Produces a new generator of collections of this generator's values.
    ///
    /// - Parameter count: The size of the random collection.
    /// - Returns: A generator of collections.
    @inlinable
    public func collection<C>(of count: Gen<Int>) -> Gen<C>
    where C: RangeReplaceableCollection, C.Element == Value {
        return count.flatMap { count in
            return Gen<C> { rng in
                var collection = C()
                guard count > 0 else { return collection }
                collection.reserveCapacity(count)
                for _ in 1...count {
                    collection.append(self._run(&rng))
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
    public func array(of count: Gen<Int>) -> Gen<[Value]> {
        return count.flatMap { count in
            return Gen<[Value]> { rng in
                var array: [Value] = []
                array.reserveCapacity(count)
                for _ in 0..<count {
                    array.append(self._run(&rng))
                }
                return array
            }
        }
    }
    
    /// Produces a new generator of dictionaries of this generator's pairs.
    ///
    /// - Parameter count: The size of the random dictionary.
    /// - Returns: A generator of dictionaries.
    @inlinable
    public func dictionary<K, V>(ofAtMost count: Gen<Int>) -> Gen<[K: V]> where Value == (K, V) {
        return count.flatMap { count in
            return Gen<[K: V]> { rng in
                var dictionary: [K: V] = [:]
                dictionary.reserveCapacity(count)
                for _ in 1...count {
                    let (k, v) = self._run(&rng)
                    dictionary[k] = v
                }
                return dictionary
            }
        }
    }
    
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set<S>(ofAtMost count: Gen<Int>) -> Gen<S> where S: SetAlgebra, S.Element == Value {
        return count.flatMap { count in
            return Gen<S> { rng in
                var set = S()
                for _ in 1...count {
                    set.insert(self._run(&rng))
                }
                return set
            }
        }
    }
}

extension Gen where Value: Hashable {
    /// Produces a new generator of sets of this generator's values.
    ///
    /// - Parameter count: The size of the random set.
    /// - Returns: A generator of sets.
    @inlinable
    public func set(ofAtMost count: Gen<Int>) -> Gen<Set<Value>> {
        return count.flatMap { count in
            return Gen<Set<Value>> { rng in
                var set: Set<Value> = []
                for _ in 1...count {
                    set.insert(self._run(&rng))
                }
                return set
            }
        }
    }
}
