//
//  ShrinkTests+Tuple.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

import PropertyBased
import Testing

@Suite struct ShrinkTupleTests {
    @Test func testShrinkTuple() throws {
        let input = (100, "foo", true)

        let shrink1 = { (_: Int) in [12, 25, 50] }
        let shrink2 = { (_: String) in ["a", "b", "c"] }
        let shrink3 = { (_: Bool) in [false] }

        let seq = Shrink.shrinkTuple(input, shrinkers: shrink1, shrink2, shrink3)
        let actual = Array(seq)

        try #require(actual.count == 7)

        #expect((12, "foo", true) == actual[0])
        #expect((25, "foo", true) == actual[1])
        #expect((50, "foo", true) == actual[2])
        #expect((100, "a", true) == actual[3])
        #expect((100, "b", true) == actual[4])
        #expect((100, "c", true) == actual[5])
        #expect((100, "foo", false) == actual[6])
    }
}
