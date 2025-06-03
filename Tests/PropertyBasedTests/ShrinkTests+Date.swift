//
//  ShrinkTests+Date.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 31/05/2025.
//

#if canImport(Foundation)
import Testing
import Foundation
@testable import PropertyBased

@Suite struct ShrinkDateTests {
    @Test func testShrinkDateTime() async throws {
        let gen = Gen.dateTime
        let now = Date().timeIntervalSinceReferenceDate
        let lastWeek = now - (60 * 60 * 24 * 7)

        let result = Array(gen._shrinker(lastWeek))

        #expect(result.count > 3)

        let last = try #require(result.last)
        #expect(last.rounded() == last)
    }

    @Test func testShrinkNarrowDateTime() async throws {
        let gen = Gen.dateTime
        let now = Date().timeIntervalSinceReferenceDate
        let lastMinute = now - 60

        let result = Array(gen._shrinker(lastMinute))

        #expect(result.count <= 3)
    }
}
#endif
