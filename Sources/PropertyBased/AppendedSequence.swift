//
//  AppendedSequence.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

public struct AppendedSequence<Element, First: Sequence<Element>, Second: Sequence<Element>> : Sequence {
    public let first: First?
    public let second: Second?
    
    public init (first: First?, second: Second?) {
        self.first = first
        self.second = second
    }
    
    @inlinable public func makeIterator() -> Iterator {
        return Iterator(first, second)
    }
    
    public struct Iterator: IteratorProtocol {
        @usableFromInline var first: First.Iterator?
        @usableFromInline var second: Second.Iterator?
        
        @inlinable init(_ first: First?, _ second: Second?) {
            self.first = first?.makeIterator()
            self.second = second?.makeIterator()
            
        }
        
        mutating public func next() -> Element? {
            return first?.next() ?? second?.next()
        }
    }
}

extension Sequence {
    @inlinable
    public func append<Other: Sequence<Element>>(_ other: Other?) -> AppendedSequence<Element, Self, Other> {
        AppendedSequence(first: self, second: other)
    }
}

extension Optional where Wrapped: Sequence {
    @inlinable
    public func append<Other: Sequence<Wrapped.Element>>(_ other: Other?) -> AppendedSequence<Wrapped.Element, Wrapped, Other> {
        AppendedSequence(first: self, second: other)
    }
}
