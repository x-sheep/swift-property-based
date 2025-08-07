//
//  ActorTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 08/09/2025.
//

import Testing

@testable import PropertyBased

@globalActor actor OtherActor {
    static let shared = OtherActor()

    func doNothing() {}
}

@Suite(.shrinking) struct ActorTests {
    @MainActor @Test func testOnMainActor() async {
        let issues = await countIssues(suppress: true) {
            await propertyCheck(input: Gen.int(in: 0...1000)) { i in
                await OtherActor.shared.doNothing()
                MainActor.assertIsolated("testOnMainActor failure")
                #expect(i < 500)
            }
        }
        #expect(issues > 0)
    }

    @OtherActor @Test func testOnOtherActor() async {
        let issues = await countIssues(suppress: true) {
            await propertyCheck(input: Gen.int(in: 0...1000)) { i in
                await MainActor.run { /* do nothing */  }
                OtherActor.assertIsolated("testOnOtherActor failure")
                #expect(i < 500)
            }
        }
        #expect(issues > 0)
    }
}
