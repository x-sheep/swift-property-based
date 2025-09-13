//
//  EnableShrinkTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 21/05/2025.
//

import Testing

/// A trait that enables or disables shrinking within a test or test suite.
///
/// Use ``shrinking(_:)`` to construct an instance of this trait.
///
/// The Swift Package Trait `"EnableShrinking"` controls if shrinking defaults to being enabled. On Swift 6.2, this is set by default.
public struct EnableShrinkTrait: TestTrait, SuiteTrait, TestScoping {
    @_documentation(visibility: internal)
    public var isRecursive: Bool { false }

    public func provideScope(
        for test: Test, testCase: Test.Case?, performing function: @Sendable () async throws -> Void
    ) async throws {
        try await Self.$isEnabled.withValue(shouldEnable) {
            try await function()
        }
    }

    #if EnableShrinking
    @TaskLocal static var isEnabled = true
    #else
    @TaskLocal static var isEnabled = false
    #endif

    var shouldEnable: Bool
}

extension Trait where Self == EnableShrinkTrait {
    /// Enable shrinking within this test or test suite.
    ///
    /// The Swift Package Trait `"EnableShrinking"` controls if shrinking defaults to being enabled. On Swift 6.2, this is set by default.
    public static var shrinking: Self { shrinking(true) }

    /// Enable or disable shrinking within this test or test suite.
    ///
    /// The Swift Package Trait `"EnableShrinking"` controls if shrinking defaults to being enabled. On Swift 6.2, this is set by default.
    ///
    /// - Parameter enabled: Whether to enable shrinking.
    /// - Returns: An instance of ``EnableShrinkTrait``.
    public static func shrinking(_ enabled: Bool = true) -> Self {
        return Self(shouldEnable: enabled)
    }
}
