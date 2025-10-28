//
//  PropertyCheckProgress.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/11/2025.
//

/// An object that contains the progress of a specific propertyCheck block.
///
/// The ``fraction`` property can be used to resize the random inputs, to gradually increase
/// the bounds of a Generator over the course of a test run.
@frozen public struct PropertyCheckProgress: Hashable, Sendable {
    internal init(completed: Int, rejected: Int, total: Int) {
        self.completed = min(completed, total)
        self._rejected = rejected
        self.total = total
    }

    /// The amount of succesfully generated random values.
    ///
    /// This value will not exceed the `total` amount.
    public internal(set) var completed: Int

    @usableFromInline internal var _rejected: Int

    /// The amount of times that the test block will be executed.
    public let total: Int

    /// A number between 0 exclusive and 1 inclusive that can be used to resize the random inputs.
    ///
    /// This number will gradually increase over the course of a test run, while taking the test duration and the Generator's filters into account.
    public var fraction: Float {
        guard total > 1 else { return 1 }

        let weight = Float(completed) + Float(rejected) / 10
        let result = weight / Float(total)
        return min(1, max(0.1, result * 4))
    }

    /// The amount of generated random values that were rejected by the Generator's filters.
    @inlinable public var rejected: Int { _rejected }

    /// An instance with a total count of one.
    ///
    /// This is equivalent to disabling sizing entirely.
    static let one: Self = PropertyCheckProgress(completed: 0, rejected: 0, total: 1)
}

extension PropertyCheckProgress: Comparable {
    public static func < (lhs: PropertyCheckProgress, rhs: PropertyCheckProgress) -> Bool {
        lhs.fraction < rhs.fraction
    }

}
