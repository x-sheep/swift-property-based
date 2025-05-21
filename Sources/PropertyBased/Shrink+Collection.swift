//
//  Shrink+Collection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 21/05/2025.
//

/// A protocol for collections that support removing elements by index, but don't necessarily conform to `RangeReplaceableCollection` or `MutableCollection`.
public protocol RemovableCollection<Element>: Collection {
    associatedtype RemoveResult
    
    @discardableResult
    @inlinable mutating func remove(at index: Index) -> RemoveResult
}

extension Dictionary: RemovableCollection {}
extension Set: RemovableCollection {}
extension Array: RemovableCollection {}

extension Shrink {
    /// Return a sequence of collections that each have one element omitted from the given collection.
    /// - Parameter collection: The collection to shrink.
    /// - Parameter lowerBound: The minimum amount of items the collection should keep.
    /// - Returns: A sequence of collections.
    public static func omitSingleElement<Element, Base: RemovableCollection<Element>>(from collection: Base, lowerBound: Int = 0) -> Shrink.Appended<LazyMapSequence<Base.Indices, Base>, Shrink.None<Base>> {
        return (collection.count > lowerBound ? collection.indices.lazy.map {
            var newCollection = collection
            newCollection.remove(at: $0)
            return newCollection
        } : nil).orEmpty()
    }
}
