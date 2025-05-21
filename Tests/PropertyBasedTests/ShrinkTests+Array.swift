//
//  ShrinkTests+Array.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

import Testing
import PropertyBased

@Suite struct ShrinkArrayTests {
    @Test func testRemoveItems() {
        let input = [4, 10, 25]
        
        let seq = Shrink.shrinkArray(input, shrinker: { _ in [] })
        let actual = Array(seq)
        
        let expected = [
            [10, 25],
            [4, 25],
            [4, 10],
        ]
        
        #expect(actual == expected)
    }
    
    @Test func testShrinkEmptyArray() {
        let seq = Shrink.shrinkArray([] as [Int], shrinker: { _ in [] })
        #expect(Array(seq).isEmpty)
    }
    
    @Test func testShrinkWithoutRemove() {
        let input = [true, true, true]
        
        let seq = Shrink.shrinkArray(input, shrinker: { _ in [false] }, lowerBound: 3)
        let actual = Array(seq)
        
        let expected = [
            [false, true, true],
            [true, false, true],
            [true, true, false],
        ]
        
        #expect(actual == expected)
    }
    
    @Test func testShrinkMultiple() {
        let input = [true, false, true]
        
        let seq = Shrink.shrinkArray(input, shrinker: [{ _ in [false] }, { _ in [true] }, { _ in [] }])
        let actual = Array(seq)
        
        let expected = [
            [false, true],
            [true, true],
            [true, false],
            [false, false, true],
            [true, true, true],
        ]
        
        #expect(actual == expected)
    }
    
    @Test func testFullShrink() {
        let input = [4, 10, 25]
        
        let seq = Shrink.shrinkArray(input, shrinker: { (i: Int) in i.shrink(towards: 0) })
        let actual = Array(seq)
        
        let expected = [
            [10, 25],
            [4, 25],
            [4, 10],
            [0, 10, 25],
            [2, 10, 25],
            [3, 10, 25],
            [4, 0, 25],
            [4, 5, 25],
            [4, 7, 25],
            [4, 8, 25],
            [4, 10, 0],
            [4, 10, 12],
            [4, 10, 18],
            [4, 10, 21],
            [4, 10, 22]
        ]
        
        #expect(actual == expected)
    }
}
