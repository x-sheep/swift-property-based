//
//  MaxAttemptsTraitTest.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 10/08/2026.
//

import Testing

@testable import PropertyBased

@Suite struct MaxAttemptsTraitTest {
    @Test func testCanModifyCount() async throws {
        let useless = Gen.always(false).filter { $0 }

        let trait = MaxAttemptsTrait.maxAttempts(20)
        let scope = try #require(trait.scopeProvider(for: Test.current!, testCase: Test.Case.current))

        let issues = await gatherIssues {
            try await scope.provideScope(for: Test.current!, testCase: Test.Case.current) {
                await propertyCheck(input: useless) { _ in
                    try #require(Bool(false), "block must not be called")
                }
            }
        }
        #expect(issues.count == 1)
        #expect(
            issues.contains(where: {
                $0.contains("20 attempts")
            }))
    }
}
