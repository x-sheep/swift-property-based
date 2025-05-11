//
//  ShrinkTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

import Testing
import PropertyBased

@Suite struct ShrinkTests {
    @Test func testShrinkTuple() throws {
        let input = (100, "foo", true)
        
        let shrink1 = [12, 25, 50]
        let shrink2 = ["a", "b", "c"]
        let shrink3 = [false]
        
        let seq = shrink(old: input, sequences: shrink1, shrink2, shrink3)
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
    
    @Test func testShrinkUInt() async throws {
        let range = 10...(100000 as UInt32)
        let results = Array(shrink(50000, within: range))
        
        try #require(results.count > 1)
        #expect(results.allSatisfy { range ~= $0 })
        
        for (a, b) in results.pairwise() {
            #expect(a > b)
        }
        
        #expect(results.last == 10)
    }
    
    @Test func testShrinkNegativeInt() async throws {
        let range = (-1000000)...(-100 as Int64)
        let results = Array(shrink(-50000, within: range))
        
        try #require(results.count > 1)
        #expect(results.allSatisfy { range ~= $0 })
        
        for (a, b) in results.pairwise() {
            #expect(a < b)
        }
        
        #expect(results.last == -100)
    }
    
    @Test func testShrinkIntToZero() async throws {
        let results = Array(shrink(-50000 as Int32, within: .min ... .max))
        try #require(results.count > 1)
        #expect(results.last == 0)
    }
}
