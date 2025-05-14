//
//  Shrink+RangeReplacableCollection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

/// Return a sequence of collections that each have one element omitted from the given collection.
/// - Parameter collection: The collection to shrink.
/// - Returns: A sequence of collections.
public func omitSingleElement<Element, Base: RangeReplaceableCollection<Element>>(collection: Base, lowerBound: Int = 0) -> (some Sequence<Base>)? {
    return collection.count > lowerBound ? collection.indices.lazy.map {
        Base(collection[..<$0] + collection[collection.index(after: $0)...])
    } : nil
}

public func shrinkArray<Item, Collection: RangeReplaceableCollection<Item> & MutableCollection<Item>>(_ array: Collection, shrinker: @escaping Shrinker<Item, some Sequence<Item>>, lowerBound: Int = 0) -> some Sequence<Collection> {
    omitSingleElement(collection: array, lowerBound: lowerBound).append(ElementWiseShrinkSequence(array, shrinker))
}
