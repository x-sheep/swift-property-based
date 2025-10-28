//
//  EnableSizingTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 10/11/2025.
//

import Testing

// TODO: describe what sizing actually is
/// A trait that enables or disables sizing within a test or test suite.
///
/// Use ``sizing(_:)`` to construct an instance of this trait.
public struct EnableSizingTrait: TestTrait, SuiteTrait, TestScoping {
    @_documentation(visibility: internal)
    public var isRecursive: Bool { false }

    public func provideScope(
        for test: Test, testCase: Test.Case?, performing function: @Sendable () async throws -> Void
    ) async throws {
        try await Self.$isEnabled.withValue(shouldEnable) {
            try await function()
        }
    }

    @TaskLocal static var isEnabled = true

    var shouldEnable: Bool
}

extension Trait where Self == EnableSizingTrait {
    // TODO: describe what sizing actually is
    /// Enable or disable sizing within this test or test suite
    ///
    /// Sizing is enabled by default. You can use this trait to enable or disable sizing for the entire suite or specific tests.
    ///
    /// ## See also
    /// You can also remove the sizing function for a specific generator.
    /// - ``/Generator/withoutSizing()``
    /// - Parameter enabled: Whether to enable sizing.
    /// - Returns: An instance of ``EnableSizingTrait``.
    public static func sizing(_ enabled: Bool) -> Self {
        return Self(shouldEnable: enabled)
    }
}
