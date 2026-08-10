//
//  MaxAttemptsTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 10/08/2026.
//

import Testing

public struct MaxAttemptsTrait: TestTrait, SuiteTrait, TestScoping {
    @_documentation(visibility: internal)
    public var isRecursive: Bool { false }

    public func provideScope(
        for test: Test, testCase: Test.Case?, performing function: @Sendable () async throws -> Void
    ) async throws {
        try await Self.$_maxAttempts.withValue(max) {
            try await function()
        }
    }

    @TaskLocal static var _maxAttempts: Int?

    var max: Int
}

extension Trait where Self == MaxAttemptsTrait {
    public static func maxAttempts(_ max: Int) -> Self {
        precondition(max >= 0, "maxAttempts must have a positive value.")
        return Self(max: max)
    }
}
