//
//  MaximumAttemptsTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 10/08/2026.
//

import Testing

/// A trait that changes how often a generator can reject values before stopping.
///
/// Use ``maximumAttempts(_:)`` to construct an instance of this trait.
public struct MaximumAttemptsTrait: TestTrait, SuiteTrait, TestScoping {
    @_documentation(visibility: internal)
    public var isRecursive: Bool { false }

    public func provideScope(
        for test: Test, testCase: Test.Case?, performing function: @Sendable () async throws -> Void
    ) async throws {
        try await Self.$_maxAttempts.withValue(value) {
            try await function()
        }
    }

    @TaskLocal static var _maxAttempts: Int?

    var value: Int
}

extension Trait where Self == MaximumAttemptsTrait {
    /// Change how often a generator can run before stopping.
    /// - Parameter limit: The new limit.
    /// - Returns: An instance of ``MaximumAttemptsTrait``.
    /// - Precondition: Limit must have a positive value.
    public static func maximumAttempts(_ limit: Int) -> Self {
        precondition(limit >= 0, "Limit must have a positive value.")
        return Self(value: limit)
    }
}
