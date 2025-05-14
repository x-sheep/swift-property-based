//
//  Shrink+MutableCollection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

public struct ElementWiseShrinkSequence<Item, Input: MutableCollection<Item>, ShrinkSequence: Sequence<Item>>: Sequence {
    public typealias Element = Input
    
    public let input: Input
    @usableFromInline let itemShrink: Shrinker<Item, ShrinkSequence>
    
    public init(_ input: Input, _ itemShrink: @escaping Shrinker<Item, ShrinkSequence>) {
        self.input = input
        self.itemShrink = itemShrink
    }
    
    public func makeIterator() -> Iterator {
        Iterator(old: input, current: input, itemShrink: itemShrink)
    }
    
    public struct Iterator: IteratorProtocol {
        @usableFromInline let old: Input
        @usableFromInline var current: Input
        
        @usableFromInline let itemShrink: Shrinker<Item, ShrinkSequence>
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
