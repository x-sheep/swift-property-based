//
//  ShrinkTests+Dictionary.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 16/05/2025.
//

import PropertyBased
import Testing

@Suite struct ShrinkDictionaryTests {
    @Test func testRemoveItemsFromSet() throws {
        let input = [25, 4, 10] as Set<Int>

        let seq = Shrink.omitSingleElement(from: input)
        let actual = Set(seq)

        let expected =
            [
                [10, 25] as Set,
                [4, 25] as Set,
                [4, 10] as Set,
            ] as Set

        try #require(actual == expected)
    }

    @Test func testShrinkEmptySet() {
        let input = [] as Set<Int>

        let seq = Shrink.omitSingleElement(from: input)
        #expect(Array(seq).isEmpty)
    }

    @Test func testRemoveItemsFromDictionary() throws {
        let input = [
            "first": 10,
            "second": 30,
            "third": 50,
        ]

        let seq = Shrink.omitSingleElement(from: input)
        let actual = Set(seq)

        let expected =
            [
                ["first": 10, "second": 30],
                ["second": 30, "third": 50],
                ["first": 10, "third": 50],
            ] as Set

        try #require(actual == expected)
    }

    @Test func testShrinkEmptyDictionary() {
        let input = [:] as [String: Int]

        let seq = Shrink.omitSingleElement(from: input)
        #expect(Array(seq).isEmpty)
    }
}
