//
//  FixedSeedTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import PropertyBased
import Testing

@Suite struct FixedSeedTests {
    @Test func testInvalidSeed() async throws {
        let trait = FixedSeedTrait.fixedSeed("qwert")
        let scope = try #require(trait.scopeProvider(for: Test.current!, testCase: Test.Case.current))

        let issues = await gatherIssues {
            await scope.provideScope(for: Test.current!, testCase: Test.Case.current) {
                try #require(Bool(false), "block must not be called")
            }
        }
        #expect(issues.count == 1)
        #expect(
            issues.contains(where: {
                $0.contains("invalid seed")
            }))
    }

    @Test func testDuplicateSeeds() async throws {
        let trait1 = FixedSeedTrait.fixedSeed("INXoBVnaU+VA/a0Vu3WfVCmT1mBMK0ZrXJb24K4vLVY=")
        let trait2 = FixedSeedTrait.fixedSeed("I9kE/glCt1MIxbFsddPUSiKFAAJBGKPHSre93c+Wz9E=")

        let issues = await gatherIssues {
            await trait1.provideScope(for: Test.current!, testCase: Test.Case.current) {
                await trait2.provideScope(for: Test.current!, testCase: Test.Case.current) {
                    try #require(Bool(false), "block must not be called")
                }
            }
        }
        #expect(issues.count == 1)
        #expect(
            issues.contains(where: {
                $0.contains("different fixed seeds")
            }))
    }

    @Test func testIdenticalInputs() async throws {
        let trait = FixedSeedTrait.fixedSeed("4tPCyvymNncnc+napVCI0T4Jc6IYw1lXOQbXlIqyHck=")
        let issues = await gatherIssues {
            await trait.provideScope(for: Test.current!, testCase: Test.Case.current) {
                await propertyCheck(input: Gen.int(in: 0...1_000_000)) { n in
                    #expect(n == 480813)
                }
            }
        }
        #expect(issues.count == 1)
        #expect(
            issues.contains(where: {
                $0.contains("no expectation failure")
            }))
    }

    @Test func testXoshiro() throws {
        var rng = try #require(Xoshiro(seed: "I9kE/glCt1MIxbFsddPUSiKFAAJBGKPHSre93c+Wz9E="))

        try #require(rng == rng)
        try #require(rng.hashValue == rng.hashValue)

        try #require(rng.currentSeed == "I9kE/glCt1MIxbFsddPUSiKFAAJBGKPHSre93c+Wz9E=")
        try #require(rng.next() == 13_012_537_654_314_612_243)
        try #require(rng.next() == 17_010_070_744_160_488_460)
        try #require(rng.next() == 15_434_697_293_255_949_747)
        try #require(rng.currentSeed == "INXoBVnaU+VA/a0Vu3WfVCmT1mBMK0ZrXJb24K4vLVY=")
    }
}
