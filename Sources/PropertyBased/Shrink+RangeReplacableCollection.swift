//
//  Shrink+RangeReplacableCollection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

extension Shrink {
    /// Return a sequence of collections that each have one element omitted from the given collection.
    /// - Parameter collection: The collection to shrink.
    /// - Parameter lowerBound: The minimum amount of items the collection should keep.
    /// - Returns: A sequence of collections.
    public static func omitSingleElement<Element, Base: RangeReplaceableCollection<Element>>(from collection: Base, lowerBound: Int = 0) -> some Sequence<Base> {
        return (collection.count > lowerBound ? collection.indices.lazy.map {
            var newCollection = collection
            newCollection.remove(at: $0)
            return newCollection
        } : nil).orEmpty()
    }
    
    /// Return a sequence of sets that each have one element omitted from the given sets.
    /// - Parameter set: The sets to shrink.
    /// - Parameter lowerBound: The minimum amount of items the sets should keep.
    /// - Returns: A sequence of sets.
    public static func omitSingleElement<Element, Base: SetAlgebra<Element> & Collection<Element>>(from set: Base, lowerBound: Int = 0) -> some Sequence<Base> {
        return (set.count > lowerBound ? set.lazy.map {
            var newSet = set
            newSet.remove($0)
            return newSet
        } : nil).orEmpty()
    }
    
    /// Return a sequence of dictionaries that each have one key/value pair omitted from the given dictionary.
    /// - Parameter dictionary: The dictionary to shrink.
    /// - Parameter lowerBound: The minimum amount of pairs the dictionary should keep.
    /// - Returns: A sequence of dictionaries.
    public static func omitSingleElement<Key, Value>(from dictionary: Dictionary<Key, Value>, lowerBound: Int = 0) -> some Sequence<Dictionary<Key, Value>> {
        return (dictionary.count > lowerBound ? dictionary.indices.lazy.map {
            var newDict = dictionary
            newDict.remove(at: $0)
            return newDict
        } : nil).orEmpty()
    }
    
    /// Return a sequence of collections that each have one element omitted or shrunk from the given collection.
    /// - Parameters:
    ///   - array: The collection to shrink.
    ///   - shrinker: The function to apply to each element of this collection.
    ///   - lowerBound: The minimum amount of items the collection should keep.
    /// - Returns: A sequence of collections.
    public static func shrinkArray<Item, Collection: RangeReplaceableCollection<Item> & MutableCollection<Item>>(_ array: Collection, shrinker: [(Item) -> some Sequence<Item>], lowerBound: Int = 0) -> some Sequence<Collection> {
        omitSingleElement(from: array, lowerBound: lowerBound).append(ElementWiseShrinkSequence(array, shrinker))
    }
    
    public static func shrinkArray<Item, Collection: RangeReplaceableCollection<Item> & MutableCollection<Item>>(_ array: Collection, shrinker: @escaping (Item) -> some Sequence<Item>, lowerBound: Int = 0) -> some Sequence<Collection> {
        omitSingleElement(from: array, lowerBound: lowerBound).append(ElementWiseShrinkSequence(array, shrinker))
    }
}
