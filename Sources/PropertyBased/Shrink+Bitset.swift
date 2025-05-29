//
//  Shrink+Bitwise.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 29/05/2025.
//

extension Shrink {
    /// A sequence of integers used for shrinking.
    ///
    /// Unlike the ``Integer`` shrinker, this sequence removes one bit a a time.
    /// It will not contain values that have bits set that are unset in the original value.
    public struct Bitwise<Element: FixedWidthInteger>: Sequence {
        @usableFromInline let initial: Element
        
        @inlinable public init(_ initial: Element) {
            self.initial = initial
        }
        
        public func makeIterator() -> Iterator {
            Iterator(value: Element.Magnitude(truncatingIfNeeded: initial))
        }
        
        public struct Iterator: IteratorProtocol {
            @usableFromInline
            var value: Element.Magnitude
            
            @usableFromInline var index: Int = 0
            
            public mutating func next() -> Element? {
                while index < Element.bitWidth {
                    let result = value & ~(1 << index)
                    index += 1
                    if result != value {
                        return Element(truncatingIfNeeded: result)
                    }
                }
                
                return nil
            }
        }
    }
}

extension Shrink.Bitwise: Sendable where Element: Sendable {}
extension Shrink.Bitwise: BitwiseCopyable where Element: BitwiseCopyable {}
extension Shrink.Bitwise.Iterator: Sendable where Element.Magnitude: Sendable {}
extension Shrink.Bitwise.Iterator: BitwiseCopyable where Element.Magnitude: BitwiseCopyable {}
