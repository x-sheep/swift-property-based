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
        @usableFromInline let itemShrink: [(Item) -> ShrinkSequence]
        
        /// Construct a new sequence.
        /// - Parameters:
        ///   - input: The original collection.
        ///   - itemShrink: The shrinker function to apply to each element of the collection.
        public init(_ input: Input, _ itemShrink: [(Item) -> ShrinkSequence]) {
            precondition(input.count == itemShrink.count, "Number of shrinkers must match number of elements")
            
            self.input = input
            self.itemShrink = itemShrink
        }
        
        public init(_ input: Input, _ itemShrink: @escaping (Item) -> ShrinkSequence) {
            self.input = input
            self.itemShrink = Array(repeatElement(itemShrink, count: input.count))
        }
        
        public func makeIterator() -> Iterator {
            Iterator(old: input, current: input, itemShrink: itemShrink)
        }
        
        public struct Iterator: IteratorProtocol {
            @usableFromInline let old: Input
            @usableFromInline var current: Input
            
            @usableFromInline let itemShrink: [(Item) -> ShrinkSequence]
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
                    
                    let shrinkIndex = itemShrink.index(itemShrink.startIndex, offsetBy: current.distance(from: current.startIndex, to: index!))
                    currentShrink = itemShrink[shrinkIndex](current[index!]).makeIterator()
                }
            }
        }
    }
}
