//
//  ShrinkTests+Float.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/05/2025.
//

import Testing
import PropertyBased

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
}
