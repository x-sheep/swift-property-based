//
//  FixedSeedTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import Testing
@testable import PropertyBased
import Gen

@Suite struct FixedSeedTests {
    private func gatherIssues(block: @Sendable () async -> Void) async -> [Issue] {
        let mutex = Mutex([] as [Issue])

        // No way to stop issues from still being recorded. Ignore those for now.
        await withKnownIssue {
            await block()
        } matching: { issue in
            mutex.withLock { $0.append(issue) }
            return true
        }
        
        return mutex.withLock { $0 }
    }
    
    @Test(.fixedSeed("qwert"))
    func testInvalidSeed() async {
        let issues = await gatherIssues {
            await propertyCheck(input: .bool) { _ in }
        }
        #expect(issues.count == 1)
        #expect(issues.contains(where: {
            $0.description.contains("invalid seed")
        }))
    }
    
    @Test(.fixedSeed("4tPCyvymNncnc+napVCI0T4Jc6IYw1lXOQbXlIqyHck="))
    func testIdenticalInputs() async throws {
        let issues = await gatherIssues {
            await propertyCheck(input: .int(in: 0...1000000)) { n in
                #expect(n == 480813)
            }
        }
        #expect(issues.count == 1)
        #expect(issues.contains(where: {
            $0.description.contains("no expectation failure")
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
