//
//  Shrink+Integer.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

public struct IntegralShrinkSequence<IntegerType: FixedWidthInteger>: Sequence, IteratorProtocol {
    public typealias Element = IntegerType
    
    @usableFromInline var current: IntegerType
    @usableFromInline var leap: IntegerType = 1
    
    @usableFromInline let isSubtracting: Bool
    @usableFromInline let end: IntegerType
    
    @usableFromInline init(start: IntegerType, end: IntegerType) {
        // TODO: this should actually run in the reverse direction.
        self.current = start
        isSubtracting = start > end
        self.end = end
    }
    
    public mutating func next() -> IntegerType? {
        guard current != end else { return nil }
        
        let (newValue, overflow) = isSubtracting ? current.subtractingReportingOverflow(leap) : current.addingReportingOverflow(leap)
        if overflow || (!isSubtracting && newValue > end) || (isSubtracting && newValue < end) {
            current = end
            return current
        }
        
        let newLeap = leap.multipliedReportingOverflow(by: 2)
        if newLeap.overflow {
            leap = .max
        } else {
            leap = newLeap.partialValue
        }
        
        current = newValue
        return current
    }
}

extension FixedWidthInteger {
    @inlinable
    public func shrink(towards bound: Self) -> IntegralShrinkSequence<Self> {
        IntegralShrinkSequence(start: self, end: bound)
    }
    
    @inlinable
    public func shrink(within range: ClosedRange<Self>) -> IntegralShrinkSequence<Self> {
        if range.lowerBound > 0 {
            shrink(towards: range.lowerBound)
        } else if range.upperBound < 0 {
            shrink(towards: range.upperBound)
        } else {
            shrink(towards: 0)
        }
    }
}

extension IntegralShrinkSequence: Sendable where IntegerType: Sendable {}
extension IntegralShrinkSequence: BitwiseCopyable where IntegerType: BitwiseCopyable {}
