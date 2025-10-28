//
//  Range+Sized.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 30/10/2025.
//

extension ClosedRange where Bound: FixedWidthInteger {
    // TODO: docs
    public func sized(from: Bound = 0, fraction: Float) -> Self {
        // TODO: implement
        return self
    }
}

extension ClosedRange where Bound: FloatingPoint {
    // TODO: docs
    public func sized(from: Bound = 0, fraction: Float) -> Self {
        // TODO: implement
        return self
    }
}

extension Range where Bound: FloatingPoint {
    // TODO: docs
    public func sized(from: Bound = 0, fraction: Float) -> Self {
        // TODO: implement
        return self
    }
}
