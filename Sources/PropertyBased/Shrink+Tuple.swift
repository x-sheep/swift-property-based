//
//  Shrink+Tuple.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

extension Shrink {
    /// A sequence of tuples where a single element of the tuple is shrunk at a time.
    ///
    /// See ``/PropertyBased/Shrink/shrinkTuple(_:shrinkers:)`` to construct an instance of this type.
    public struct Tuple<Element>: Sequence {
        // Variadic types aren't supported on all platforms, so this struct erases the packed parameters by only holding on to a closure.
        
        @usableFromInline init(_ iteratorFunc: @escaping () -> Iterator) {
            self.iteratorFunc = iteratorFunc
        }
        let iteratorFunc: () -> Iterator
        
        /// > Warning: The result of this function is not copyable by value.
        /// >
        /// > While you can call this function multiple times, you cannot clone an iterator.
        public func makeIterator() -> Iterator {
            return iteratorFunc()
        }
        
        /// > Warning: This iterator is not copied by value.
        /// >
        /// > While you can iterate the sequence multiple times, you cannot clone an iterator.
        public final class Iterator: IteratorProtocol {
            @usableFromInline init (nextFunc: @escaping () -> Element?) {
                self.nextFunc = nextFunc
            }
            let nextFunc: () -> Element?
            
            public func next() -> Element? {
                return nextFunc()
            }
        }
    }
    
    /// Return a sequence of tuples that each have one element shrunk from the given tuple.
    /// - Parameters:
    ///   - tuple: The tuple to shrink.
    ///   - shrinkers: A list of shrinkers, which will be used for each position in the tuple. The length of this parameter must match the length of the tuple.
    /// - Returns: A sequence of tuples.
    public static func shrinkTuple<each Iter: Sequence>(
        _ tuple: (repeat (each Iter).Element),
        shrinkers: repeat @escaping ((each Iter).Element) -> each Iter
    ) -> Tuple<(repeat (each Iter).Element)> {
        return Tuple {
            var iters = (repeat (each shrinkers)(each tuple).makeIterator())
            var hasMoreValues = true
            
            return .init {
                // If the previous attempt to get a new value didn't produce anything, the sequence is exhausted.
                guard hasMoreValues else { return nil }
                
                // Pack iteration requires going over the entire tuple to make a new tuple.
                // This flag is used to signal other iterators to skip their attempt to get a new value.
                hasMoreValues = false
                
                let newValue = (repeat (each iters).vend(&hasMoreValues, each tuple))
                
                iters = (repeat (each newValue).iter)
                
                return hasMoreValues ? (repeat (each newValue).value) : nil
            }
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
extension Shrink.Tuple: Sendable {}
@available(*, unavailable)
extension Shrink.Tuple.Iterator: Sendable {}
