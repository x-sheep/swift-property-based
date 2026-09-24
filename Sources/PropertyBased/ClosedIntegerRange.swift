//
//  ClosedIntegerRange.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/05/2025.
//

extension ClosedRange where Bound: FixedWidthInteger {
    /// Coerce any range to a ClosedRange.
    ///
    /// If the range doesn't have a lower or upper bound, `Bound.min` and `Bound.max` are used respectively.
    @usableFromInline init(_ range: some RangeExpression<Bound>) {
        if let range = range as? ClosedRange<Bound> {
            // Already closed. `relative(to:)` below would ask for the index after
            // `Bound.max` when a closed range ends there, which traps.
            self = range
        } else if !range.contains(Bound.max) {
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
