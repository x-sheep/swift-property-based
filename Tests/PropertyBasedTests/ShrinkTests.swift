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
    
    @Test func testShrinkUIntToLow() async throws {
        let start = 60000 as UInt32
        let range = 10...(100000 as UInt32)
        let results = Array(start.shrink(within: range))
        
        try #require(results.count > 1)
        #expect(results.allSatisfy { range ~= $0 })
        
        for (a, b) in results.pairwise() {
            #expect(a < b)
        }
        
        #expect(results.first == 10)
        #expect(!results.contains(start))
    }
    
    @Test func testShrinkUIntToHigh() async throws {
        let start = 100 as UInt32
        let results = Array(start.shrink(towards: 50000))
        
        try #require(results.count > 1)
        #expect(results.allSatisfy { 100...50000 ~= $0 })
        
        for (a, b) in results.pairwise() {
            #expect(a > b)
        }
        
        #expect(results.first == 50000)
        #expect(!results.contains(start))
    }
    
    @Test func testShrinkNegativeInt() async throws {
        let start = -50000 as Int64
        let range = (-1000000)...(-100 as Int64)
        let results = Array(start.shrink(within: range))
        
        try #require(results.count > 1)
        #expect(results.allSatisfy { range ~= $0 })
        
        for (a, b) in results.pairwise() {
            #expect(a > b)
        }
        
        #expect(results.first == -100)
        #expect(!results.contains(start))
    }
    
    @Test func testShrinkIntToZero() async throws {
        let start = -50000 as Int32
        let results = Array(start.shrink(within: .min ... .max))
        try #require(results.count > 1)
        #expect(results.first == 0)
        #expect(!results.contains(start))
    }
    
    @Test func testMinToMax() async throws {
        let results = Array(Int.min.shrink(towards: Int.max))
        try #require(results.count > 1)
        #expect(results.first == .max)
        #expect(!results.contains(.min))
    }
    
    @Test func testMaxToMin() async throws {
        let results = Array(Int.max.shrink(towards: Int.min))
        try #require(results.count > 1)
        #expect(results.first == .min)
        #expect(!results.contains(.max))
    }
}
