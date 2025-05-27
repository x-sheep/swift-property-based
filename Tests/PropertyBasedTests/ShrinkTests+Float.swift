//
//  ShrinkTests+Float.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/05/2025.
//

import Testing
@testable import PropertyBased

@Suite struct ShrinkFloatTests {
    static let args: [Double] = [0, 5000.0, -4000.0, 1.0e40, -1.0e30, .infinity, -.infinity]
    
    @Test(arguments: args, args)
    func testShrinkTowardsZero(start: Double, end: Double) throws {
        let results = Array(start.shrink(towards: end))
        
        if start == end {
            #expect(results.isEmpty)
            return
        }
        
        try #require(results.count > 1)
        #expect(results.first == end)
        #expect(!results.contains(start))
    }
    
    @Test func testShrinkWithNan() throws {
        let nan: Double = .nan
        
        #expect(Array(nan.shrink(towards: 1)).isEmpty)
        #expect(Array(nan.shrink(towards: -1)).isEmpty)
        #expect(Array(1.shrink(towards: nan)).isEmpty)
        #expect(Array((-1).shrink(towards: nan)).isEmpty)
        #expect(Array(nan.shrink(towards: .signalingNaN)).isEmpty)
    }
    
    @Test func testShrinkTowardsBound() throws {
        let shrink1 = (4.0).shrink(within: 2...)
        #expect(shrink1.current == 2)
        
        let shrink2 = (1.0).shrink(within: ...3)
        #expect(shrink2.current == 0)
        
        let shrink3 = (-5.0).shrink(within: ..<(-3))
        #expect(shrink3.current < -3)
        
        let shrink4 = (-5.0).shrink(within: -2 ... -1)
        #expect(shrink4.current == -1)
        
        let shrink5 = (20).shrink(within: 1.5 ... 10)
        #expect(shrink5.current == 1.5)
    }
}
