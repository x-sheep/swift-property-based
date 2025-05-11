//
//  Shrink+Tuple.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

extension IteratorProtocol {
    func vend(_ didShrink: inout Bool, _ fallback: Element) -> (iter: Self, value: Element) {
        if didShrink { return (self, fallback) }
        var copy = self
        
        guard let next = copy.next() else {
            return (copy, fallback)
        }
        
        didShrink = true
        return (copy, next)
    }
}

public struct TupleShrinkSequence<Element>: Sequence {
    let iteratorFunc: () -> Iterator
    
    public func makeIterator() -> Iterator {
        return iteratorFunc()
    }
    
    public struct Iterator: IteratorProtocol {
        let nextFunc: () -> Element?
        
        public mutating func next() -> Element? {
            return nextFunc()
        }
    }
}

public func shrink<each Iter: Sequence>(
    old: (repeat (each Iter).Element),
    sequences: repeat each Iter
) -> TupleShrinkSequence<(repeat (each Iter).Element)> {
    var iters = (repeat (each sequences).makeIterator())
    
    return TupleShrinkSequence {
        .init {
            var didShrink = false
            
            let newValue = (repeat (each iters).vend(&didShrink, each old))
            
            iters = (repeat (each newValue).iter)
            
            return didShrink ? (repeat (each newValue).value) : nil
        }
    }
}
