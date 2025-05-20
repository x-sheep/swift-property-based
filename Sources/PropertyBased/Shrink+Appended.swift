//
//  Shrink+Appended.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

extension Shrink {
    /// Appends two sequences. The sequences can have different types, as long as the elements have the same type.
    public struct Appended<First: Sequence, Second: Sequence> : Sequence where First.Element == Second.Element {
        public typealias Element = First.Element
        
        public let first: First?
        public let second: Second?
        
        /// Create a sequence by appending two sequences.
        ///
        /// A `nil` parameter is treated as an empty sequence.
        /// - Parameters:
        ///   - first: The first sequence.
        ///   - second: The second sequence.
        @inlinable public init(first: First?, second: Second?) {
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
}

extension Sequence {
    /// Append a sequence to this sequence.
    /// - Parameter other: The sequence to append. If this is `nil`, no elements are appended.
    /// - Returns: A new sequence.
    @inlinable
    public func append<Other: Sequence>(_ other: Other?) -> Shrink.Appended<Self, Other> where Other.Element == Element {
        Shrink.Appended(first: self, second: other)
    }
}

extension Optional where Wrapped: Sequence {
    /// Append a sequence to this sequence. If this sequence is nil, the other sequence is returned.
    /// - Parameter other: The sequence to append. If this is `nil`, no elements are appended.
    /// - Returns: A new sequence.
    @inlinable
    public func append<Other: Sequence>(_ other: Other?) -> Shrink.Appended<Wrapped, Other> where Other.Element == Wrapped.Element {
        Shrink.Appended(first: self, second: other)
    }
    
    @inlinable func orEmpty() -> Shrink.Appended<Wrapped, Shrink.None<Wrapped.Element>> {
        Shrink.Appended(first: self, second: nil as Shrink.None?)
    }
}
