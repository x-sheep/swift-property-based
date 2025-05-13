//
//  Shrink+Float.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/05/2025.
//

public struct FloatingPointShrinkSequence<FloatType: FloatingPoint>: Sequence, IteratorProtocol {
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

extension FloatingPoint {
    @inlinable
    public func shrink(towards bound: Self) -> FloatingPointShrinkSequence<Self> {
        FloatingPointShrinkSequence(from: self, bound: bound)
    }
    
    @inlinable
    public func shrink(within range: ClosedRange<Self>) -> FloatingPointShrinkSequence<Self> {
        if range.lowerBound > 0 {
            shrink(towards: range.lowerBound)
        } else if range.upperBound < 0 {
            shrink(towards: range.upperBound)
        } else {
            shrink(towards: 0)
        }
    }
    
    @inlinable public func shrink(within range: Range<Self>) -> FloatingPointShrinkSequence<Self> {
        shrink(within: range.lowerBound ... range.upperBound.nextDown)
    }
    @inlinable public func shrink(within range: PartialRangeThrough<Self>) -> FloatingPointShrinkSequence<Self> {
        shrink(towards: min(0, range.upperBound))
    }
    @inlinable public func shrink(within range: PartialRangeUpTo<Self>) -> FloatingPointShrinkSequence<Self> {
        shrink(towards: min(0, range.upperBound.nextDown))
    }
    @inlinable public func shrink(within range: PartialRangeFrom<Self>) -> FloatingPointShrinkSequence<Self> {
        shrink(towards: max(0, range.lowerBound))
    }
}

extension FloatingPointShrinkSequence: Sendable where FloatType: Sendable {}
extension FloatingPointShrinkSequence: BitwiseCopyable where FloatType: BitwiseCopyable {}
