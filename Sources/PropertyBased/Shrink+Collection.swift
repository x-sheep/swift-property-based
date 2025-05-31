//
//  Shrink+Collection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 21/05/2025.
//

/// A protocol for collections that support removing elements by index, but don't necessarily conform to `RangeReplaceableCollection`.
///
/// Custom collection types can use this protocol to support shrinking by removing elements. All types that conform to `RangeReplaceableCollection`
/// already meet the requirement, and `swift-collection` types such as `OrderedSet` and `OrderedDictionary` can also conform without further changes.
public protocol RemovableCollection<Element>: Collection {
    /// Remove the element at the specified position.
    ///
    /// The shrinker will make a copy of this collection and call this method once for every valid index.
    /// - Parameter i: The position of the element to remove. index must be a valid index of the collection that is not equal to the collection’s end index.
    /// - Returns: The removed element.
    @discardableResult
    @inlinable mutating func remove(at i: Index) -> Element
}

extension Dictionary: RemovableCollection {}
extension Set: RemovableCollection {}
extension Array: RemovableCollection {}

extension Shrink {
    /// Shrink a collection by omitting each element one at a time.
    ///
    /// See ``/PropertyBased/Shrink/omitSingleElement(from:lowerBound:)`` to construct an instance of this type.
    public struct Omit<Seq: RemovableCollection>: Sequence {
        let collection: Seq
        let isActive: Bool
        
        public func makeIterator() -> Iterator {
            Iterator(collection: collection, index: isActive ? collection.startIndex : collection.endIndex)
        }
        
        public struct Iterator: IteratorProtocol {
            let collection: Seq
            var index: Seq.Index
            
            public mutating func next() -> Seq? {
                guard index != collection.endIndex else { return nil }
                defer { index = collection.index(after: index) }
                
                var newCollection = collection
                newCollection.remove(at: index)
                return newCollection
            }
        }
    }
    
    /// Return a sequence of collections that each have one element omitted from the given collection.
    /// - Parameter collection: The collection to shrink.
    /// - Parameter lowerBound: The minimum amount of items the collection should keep.
    /// - Returns: A sequence of collections.
    public static func omitSingleElement<Base: RemovableCollection>(from collection: Base, lowerBound: Int = 0) -> Shrink.Omit<Base> {
        return Omit(collection: collection, isActive: collection.count > lowerBound)
    }
}
