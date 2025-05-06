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
    
    @Test(.fixedSeed("11223344556677889900aabbccddeeff"))
    func testIdenticalInputs() async throws {
        let issues = await gatherIssues {
            await propertyCheck(input: .int(in: 0...1000000)) { n in
                #expect(n == 960927)
            }
        }
        #expect(issues.count == 1)
        #expect(issues.contains(where: {
            $0.description.contains("no expectation failure")
        }))
    }
    
    @Test func testXoshiro() throws {
        var rng = try #require(Xoshiro(seed: "532896ad4a02a15e184a6be2ad433acd"))
        
        try #require(rng.currentSeed == "532896ad4a02a15e184a6be2ad433acd")
        rng.perturb()
        try #require(rng.next() == 4810111524902131809)
        try #require(rng.next() == 8977626393675964846)
        try #require(rng.next() == 1239627430587387523)
        try #require(rng.currentSeed == "68fb55a91e543b7a00c18b38f77fb1b6")
    }
}
