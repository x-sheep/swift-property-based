//
//  Shrink+Integer.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

public struct IntegralShrinkSequence<IntegerType: FixedWidthInteger>: Sequence {
    public typealias Element = IntegerType
    
    @usableFromInline let start: IntegerType
    @usableFromInline let end: IntegerType
    public init(start: IntegerType, end: IntegerType) {
        self.start = start
        self.end = end
    }
    
    public func makeIterator() -> Iterator {
        precondition(start.signum() == end.signum() || start.signum() == 0 || end.signum() == 0)
        return Iterator(current: start, end: end)
    }
    
    public struct Iterator: IteratorProtocol {
        @usableFromInline var current: IntegerType
        @usableFromInline let end: IntegerType
        public mutating func next() -> IntegerType? {
            guard current != end else { return nil }
            
            current = ((current - end) / 2) + end
            return current
        }
    }
}

public func shrink<IntegerType: FixedWidthInteger>(_ value: IntegerType, within range: ClosedRange<IntegerType>) -> IntegralShrinkSequence<IntegerType> {
    if range.lowerBound > 0 {
        IntegralShrinkSequence(start: value, end: range.lowerBound)
    } else if range.upperBound < 0 {
        IntegralShrinkSequence(start: value, end: range.upperBound)
    } else {
        IntegralShrinkSequence(start: value, end: 0)
    }
}

extension IntegralShrinkSequence: BitwiseCopyable where IntegerType: BitwiseCopyable {}
extension IntegralShrinkSequence.Iterator: BitwiseCopyable where IntegerType: BitwiseCopyable {}
