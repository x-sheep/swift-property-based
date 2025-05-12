//
//  Shrink+Tuple.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

public struct TupleShrinkSequence<Element>: Sequence {
    // Variadic types aren't supported on all platforms, so this struct erases the packed parameters by only holding on to a closure.
    
    @usableFromInline init(_ iteratorFunc: @escaping () -> Iterator) {
        self.iteratorFunc = iteratorFunc
    }
    let iteratorFunc: () -> Iterator
    
    public func makeIterator() -> Iterator {
        return iteratorFunc()
    }
    
    public struct Iterator: IteratorProtocol {
        @usableFromInline init (nextFunc: @escaping () -> Element?) {
            self.nextFunc = nextFunc
        }
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
    return TupleShrinkSequence {
        var iters = (repeat (each sequences).makeIterator())
        var hasMoreValues = true
        
        return .init {
            // If the previous attempt to get a new value didn't produce anything, the sequence is exhausted.
            guard hasMoreValues else { return nil }
            
            // Pack iteration requires going over the entire tuple to make a new tuple.
            // This flag is used to signal other iterators to skip their attempt to get a new value.
            hasMoreValues = false
            
            let newValue = (repeat (each iters).vend(&hasMoreValues, each old))
            
            iters = (repeat (each newValue).iter)
            
            return hasMoreValues ? (repeat (each newValue).value) : nil
        }
    }
}

extension IteratorProtocol {
    // Utility function to be used inside pack iteration. Inout parameters are not supported,
    // so this function returns a mutated copy of the iterator instead.
    func vend(_ stopSignal: inout Bool, _ fallback: Element) -> (iter: Self, value: Element) {
        if stopSignal { return (self, fallback) }
        var copy = self
        
        guard let next = copy.next() else {
            return (copy, fallback)
        }
        
        stopSignal = true
        return (copy, next)
    }
}

@available(*, unavailable)
extension TupleShrinkSequence: Sendable {}
@available(*, unavailable)
extension TupleShrinkSequence.Iterator: Sendable {}
