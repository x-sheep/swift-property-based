//
//  Shrink+Integer.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

extension Shrink {
    /// A sequence of integers used for shrinking.
    ///
    /// See ``/PropertyBased/Swift/FixedWidthInteger/shrink(towards:)`` to construct a sequence of this type.
    public struct IntegralShrinkSequence<IntegerType: FixedWidthInteger>: Sequence, IteratorProtocol {
        public typealias Element = IntegerType
        
        @usableFromInline var current: IntegerType
        @usableFromInline var leap: IntegerType
        
        @usableFromInline let isSubtracting: Bool
        
        /// The first value in the sequence.
        @usableFromInline let first: IntegerType
        /// Stop the sequence when reaching the end. Do not yield this value.
        @usableFromInline let end: IntegerType
        
        @usableFromInline init(from: IntegerType, bound: IntegerType) {
            first = bound
            current = bound
            end = from
            isSubtracting = bound > from
            
            let newLeap: (partialValue: IntegerType, overflow: Bool)
            if isSubtracting {
                newLeap = (bound / 2).subtractingReportingOverflow(from / 2)
            } else {
                newLeap = (from / 2).subtractingReportingOverflow(bound / 2)
            }
            leap = !newLeap.overflow ? newLeap.partialValue : .max / 2
        }
        
        public mutating func next() -> IntegerType? {
            let hasReachedEnd = isSubtracting ? current <= end : current >= end
            guard !hasReachedEnd, leap > 0 else {
                return nil
            }
            
            defer {
                if isSubtracting {
                    current -= leap
                } else {
                    current += leap
                }
            }
            if current != first {
                leap /= 2
            }
            return current
        }
    }
}

extension FixedWidthInteger {
    /// Get a shrinking sequence that shrinks this value to a specific value.
    /// - Parameter bound: The value to shrink to.
    /// - Returns: A new sequence.
    @inlinable
    public func shrink(towards bound: Self) -> Shrink.IntegralShrinkSequence<Self> {
        Shrink.IntegralShrinkSequence(from: self, bound: bound)
    }
    
    /// Get a shrinking sequence that shrinks this value as close to zero as possible.
    /// - Parameter range: If this range doesn't contain zero, the bound closest to zero will be used.
    /// - Returns: A new sequence.
    @inlinable
    public func shrink(within range: ClosedRange<Self>) -> Shrink.IntegralShrinkSequence<Self> {
        if range.lowerBound > 0 {
            shrink(towards: range.lowerBound)
        } else if range.upperBound < 0 {
            shrink(towards: range.upperBound)
        } else {
            shrink(towards: 0)
        }
    }
    
    @inlinable
    public func shrink(within range: some RangeExpression<Self>) -> Shrink.IntegralShrinkSequence<Self> {
        shrink(within: ClosedRange(range))
    }
}

extension Shrink.IntegralShrinkSequence: Sendable where IntegerType: Sendable {}
extension Shrink.IntegralShrinkSequence: BitwiseCopyable where IntegerType: BitwiseCopyable {}
