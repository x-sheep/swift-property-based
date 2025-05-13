//
//  ClosedIntegerRange.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/05/2025.
//

extension ClosedRange where Bound: FixedWidthInteger {
    @usableFromInline init(_ range: some RangeExpression<Bound>) {
        if !range.contains(Bound.max) {
            self = .init(range.relative(to: .min ..< .max))
        } else if range.contains(Bound.min) {
            self = .min ... .max
        } else if range.contains(Bound.max - 1) {
            self = range.relative(to: .min ..< .max).lowerBound ... .max
        } else {
            self = .max ... .max
        }
    }
}
