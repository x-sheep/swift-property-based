//
//  Shrink+Float.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/05/2025.
//

extension Shrink {
    /// A sequence of floats used for shrinking.
    ///
    /// See ``/PropertyBased/Swift/FloatingPoint/shrink(towards:)`` to construct a sequence of this type.
    public struct Floating<FloatType: FloatingPoint>: Sequence, IteratorProtocol {
        public typealias Element = FloatType
        
        @usableFromInline var current: FloatType
        @usableFromInline var leap: FloatType
        
        /// The first value in the sequence.
        @usableFromInline let first: FloatType
        /// Stop the sequence when reaching the end. Do not yield this value.
        @usableFromInline let end: FloatType
        
        @usableFromInline init(from: FloatType, bound: FloatType) {
            first = bound
            current = bound
            end = from
            
            leap = (from / 2) - (bound / 2)
            if leap.isNaN {
                current = .nan
            } else if leap.isInfinite {
                leap = leap > 0 ? .greatestFiniteMagnitude : -.greatestFiniteMagnitude
            }
        }
        
        public mutating func next() -> FloatType? {
            guard !current.isNaN else {
                return nil
            }
            
            let hasReachedEnd = leap < 0 ? current <= end : current >= end
            guard !hasReachedEnd, leap != 0 else {
                return nil
            }
            
            if current.isInfinite {
                defer { current = current > 0 ? .greatestFiniteMagnitude : -.greatestFiniteMagnitude }
                return current
            }
            
            defer {
                let newValue = current + leap
                current = newValue != current ? newValue : end
            }
            
            leap /= 2
            return current
        }
    }
}

extension FloatingPoint {
    /// Get a shrinking sequence that shrinks this value to a specific value.
    ///
    /// If this value or the given bound is NaN, the sequence is empty.
    /// - Parameter bound: The value to shrink to.
    /// - Returns: A new sequence.
    @inlinable
    public func shrink(towards bound: Self) -> Shrink.Floating<Self> {
        Shrink.Floating(from: self, bound: bound)
    }
    
    /// Get a shrinking sequence that shrinks this value as close to the given bound as possible.
    ///
    /// If this value is NaN, the sequence is empty.
    /// - Parameter range: If this range doesn't contain the `bound` parameter, the bound closest to the `bound` parameter will be used.
    /// - Parameter bound: The preferred bound to shrink towards. Defaults to zero.
    /// - Returns: A new sequence.
    public func shrink(within range: ClosedRange<Self>, towards bound: Self = 0) -> Shrink.Floating<Self> {
        if range.lowerBound > bound {
            shrink(towards: range.lowerBound)
        } else if range.upperBound < bound {
            shrink(towards: range.upperBound)
        } else {
            shrink(towards: bound)
        }
    }
    
    @inlinable public func shrink(within range: Range<Self>, towards bound: Self = 0) -> Shrink.Floating<Self> {
        shrink(within: range.lowerBound ... range.upperBound.nextDown, towards: bound)
    }
    @inlinable public func shrink(within range: PartialRangeThrough<Self>, towards bound: Self = 0) -> Shrink.Floating<Self> {
        shrink(towards: min(bound, range.upperBound))
    }
    @inlinable public func shrink(within range: PartialRangeUpTo<Self>, towards bound: Self = 0) -> Shrink.Floating<Self> {
        shrink(towards: min(bound, range.upperBound.nextDown))
    }
    @inlinable public func shrink(within range: PartialRangeFrom<Self>, towards bound: Self = 0) -> Shrink.Floating<Self> {
        shrink(towards: max(bound, range.lowerBound))
    }
}

extension Shrink.Floating: Sendable where FloatType: Sendable {}
extension Shrink.Floating: BitwiseCopyable where FloatType: BitwiseCopyable {}
