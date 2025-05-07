//
//  FixedSeedTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import Testing
import PropertyBased
import Gen

@Suite struct FixedSeedTests {
    @Test func testInvalidSeed() async throws {
        let trait = FixedSeedTrait.fixedSeed("qwert")
        let scope = try #require(trait.scopeProvider(for: Test.current!, testCase: Test.Case.current))
        
        let issues = await gatherIssues {
            try await scope.provideScope(for: Test.current!, testCase: Test.Case.current) {
                try #require(Bool(false), "block must not be called")
            }
        }
        #expect(issues.count == 1)
        #expect(issues.contains(where: {
            $0.contains("invalid seed")
        }))
    }
    
    @Test func testDuplicateSeeds() async throws {
        let trait1 = FixedSeedTrait.fixedSeed("INXoBVnaU+VA/a0Vu3WfVCmT1mBMK0ZrXJb24K4vLVY=")
        let trait2 = FixedSeedTrait.fixedSeed("I9kE/glCt1MIxbFsddPUSiKFAAJBGKPHSre93c+Wz9E=")
        
        let issues = await gatherIssues {
            try await trait1.provideScope(for: Test.current!, testCase: Test.Case.current) {
                try await trait2.provideScope(for: Test.current!, testCase: Test.Case.current) {
                    try #require(Bool(false), "block must not be called")
                }
            }
        }
        #expect(issues.count == 1)
        #expect(issues.contains(where: {
            $0.contains("different fixed seeds")
        }))
    }
    
    @Test func testIdenticalInputs() async throws {
        let trait = FixedSeedTrait.fixedSeed("4tPCyvymNncnc+napVCI0T4Jc6IYw1lXOQbXlIqyHck=")
        let issues = await gatherIssues {
            try await trait.provideScope(for: Test.current!, testCase: Test.Case.current) {
                await propertyCheck(input: .int(in: 0...1000000)) { n in
                    #expect(n == 480813)
                }
            }
        }
        #expect(issues.count == 1)
        #expect(issues.contains(where: {
            $0.contains("no expectation failure")
        }))
    }
    
    @Test func testXoshiro() throws {
        var rng = try #require(Xoshiro(seed: "I9kE/glCt1MIxbFsddPUSiKFAAJBGKPHSre93c+Wz9E="))
        
        try #require(rng.currentSeed == "I9kE/glCt1MIxbFsddPUSiKFAAJBGKPHSre93c+Wz9E=")
        try #require(rng.next() == 13012537654314612243)
        try #require(rng.next() == 17010070744160488460)
        try #require(rng.next() == 15434697293255949747)
        try #require(rng.currentSeed == "INXoBVnaU+VA/a0Vu3WfVCmT1mBMK0ZrXJb24K4vLVY=")
    }
}
