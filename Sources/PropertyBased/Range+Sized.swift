//
//  Range+Sized.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 30/10/2025.
//

extension ClosedRange where Bound: FixedWidthInteger {
    // TODO: docs
    public func sized(from center: Bound = 0, fraction: Float) -> Self {
        precondition(fraction > 0, "Fraction must be a positive number above 0")
        guard fraction < 1 else { return self }
        let inverse = (1 / fraction).rounded()
        let divisor = inverse.isFinite ? Bound(inverse) : 0

        let (distance, overflow) = upperBound.subtractingReportingOverflow(lowerBound)

        if contains(center) || overflow {
            // TODO: make better use of center here
            var newLower = Bound(exactly: (Float(lowerBound) * fraction).rounded(.towardZero))
            var newUpper = Bound(exactly: (Float(upperBound) * fraction).rounded(.towardZero))

            if newLower == nil && divisor > 0 {
                newLower = lowerBound / divisor
            }
            if newUpper == nil && inverse > 0 {
                newUpper = upperBound / divisor
            }

            guard let newLower, let newUpper else {
                return self
            }

            if newLower > newUpper {
                return (newLower...newLower).clamped(to: self)
            }
            return (newLower...newUpper).clamped(to: self)
        }

        var newDistance = Bound(exactly: (Float(distance) * fraction).rounded(.towardZero))
        if newDistance == nil && divisor > 0 {
            newDistance = distance / divisor
        }

        guard let newDistance else { return self }

        if lowerBound > center {
            return (lowerBound...(lowerBound + newDistance))
        } else {
            return ((upperBound - newDistance)...upperBound)
        }
    }
}

extension ClosedRange where Bound: FloatingPoint {
    // TODO: docs
    public func sized(from: Bound = 0, fraction: Float) -> Self {
        precondition(fraction > 0, "Fraction must be a positive number above 0")
        guard fraction < 1 else { return self }

        // TODO: implement
        return self
    }
}

extension Range where Bound: FloatingPoint {
    // TODO: docs
    public func sized(from: Bound = 0, fraction: Float) -> Self {
        precondition(fraction > 0, "Fraction must be a positive number above 0")
        guard fraction < 1 else { return self }

        // TODO: implement
        return self
    }
}
