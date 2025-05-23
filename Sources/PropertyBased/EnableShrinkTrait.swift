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
/// > Note: This feature is experimental, and disabled by default. The shrinking output will be very verbose, due to a limitation in Swift Testing.
public struct EnableShrinkTrait: TestTrait, SuiteTrait, TestScoping {
    @_documentation(visibility: internal)
    public var isRecursive: Bool { false }
    
    public func provideScope(for test: Test, testCase: Test.Case?, performing function: @Sendable () async throws -> Void) async throws {
        try await Self.$isEnabled.withValue(shouldEnable) {
            try await function()
        }
    }
    
    @TaskLocal static var isEnabled = false
    
    var shouldEnable: Bool
}

extension Trait where Self == EnableShrinkTrait {
    /// Enable shrinking within this test or test suite.
    public static var shrinking: Self { shrinking(true) }
    
    /// Enable or disable shrinking within this test or test suite.
    /// - Parameter enabled: Whether to enable shrinking.
    /// - Returns: An instance of ``EnableShrinkTrait``.
    public static func shrinking(_ enabled: Bool = true) -> Self {
        return Self(shouldEnable: enabled)
    }
}
