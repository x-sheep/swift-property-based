//
//  EnableShrinkTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 21/05/2025.
//

import Testing

public struct EnableShrinkTrait: TestTrait, SuiteTrait, TestScoping {
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
    public static var shrinking: Self { shrinking(true) }
    
    public static func shrinking(_ enabled: Bool = true) -> Self {
        return Self(shouldEnable: enabled)
    }
}
