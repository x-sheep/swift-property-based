//
//  Shrink+MutableCollection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

extension Shrink {
    /// A sequence of collections where a single element of the collection is shrunk at a time.
    public struct ElementWise<Item, Input: MutableCollection<Item>, ShrinkSequence: Sequence<Item>>: Sequence {
        public typealias Element = Input

        @usableFromInline let input: Input
        @usableFromInline let itemShrink: (Item) -> ShrinkSequence

        /// Construct a new sequence.
        /// - Parameters:
        ///   - input: The original collection.
        ///   - itemShrink: The shrinker function to apply to each element of the collection.
        public init(_ input: Input, _ itemShrink: @escaping (Item) -> ShrinkSequence) {
            self.input = input
            self.itemShrink = itemShrink
        }

        public func makeIterator() -> Iterator {
            Iterator(old: input, current: input, itemShrink: itemShrink)
        }

        public struct Iterator: IteratorProtocol {
            @usableFromInline let old: Input
            @usableFromInline var current: Input

            @usableFromInline let itemShrink: (Item) -> ShrinkSequence
            @usableFromInline var currentShrink: ShrinkSequence.Iterator?

            @usableFromInline var index: Input.Index?

            public mutating func next() -> Element? {
                guard index != old.endIndex else { return nil }

                while true {
                    if let index, let newItem = currentShrink?.next() {
                        current[index] = newItem
                        return current
                    }

                    if let oldIndex = index {
                        index = old.index(after: oldIndex)
                        current[oldIndex] = old[oldIndex]
                    } else {
                        index = old.startIndex
                    }

                    if index == old.endIndex {
                        currentShrink = nil
                        return nil
                    }

                    currentShrink = itemShrink(current[index!]).makeIterator()
                }
            }
        }
    }

    /// Return a sequence of collections that each have one element omitted or shrunk from the given collection.
    /// - Parameters:
    ///   - array: The collection to shrink.
    ///   - shrinker: The function to apply to each element of this collection.
    ///   - lowerBound: The minimum amount of items the collection should keep.
    /// - Returns: A sequence of collections.
    public static func shrinkArray<
        Item, Shrinker: Sequence<Item>,
        Input: RemovableCollection<Item> & MutableCollection<Item>
    >(_ array: Input, shrinker: @escaping (Item) -> Shrinker, lowerBound: Int = 0)
        -> Shrink.Appended<Shrink.Omit<Input>, Shrink.ElementWise<Item, Input, Shrinker>>
    {
        omitSingleElement(from: array, lowerBound: lowerBound).append(ElementWise(array, shrinker))
    }
}
