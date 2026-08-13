//
//  MaximumAttemptsTraitTest.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 10/08/2026.
//

import Testing

@testable import PropertyBased

@Suite struct MaximumAttemptsTraitTest {
    @Test func testRunUsesLimit() {
        let useless = Gen.always(false).filter { $0 }

        #expect(throws: GeneratorError.runLimitExceeded(25)) {
            var rng = Xoshiro()
            _ = try useless.run(using: &rng, limit: 25)
        }
    }

    @Test func testTraitCanModifyCount() async throws {
        let useless = Gen.always(false).filter { $0 }

        let trait = MaximumAttemptsTrait.maximumAttempts(20)
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
                $0.contains("20 attempts") && !$0.contains("maximumAttempts()")
            }))
    }

    @Test func testTraitSuggestion() async throws {
        let useless = Gen.always(false).filter { $0 }
        let issues = await gatherIssues {
            await propertyCheck(input: useless) { _ in
                try #require(Bool(false), "block must not be called")
            }
        }

        #expect(issues.count == 1)
        #expect(
            issues.contains(where: {
                $0.contains("maximumAttempts()")
            }))
    }
}
