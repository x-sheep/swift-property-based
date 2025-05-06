//
//  PropertyCheckTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import Testing
@testable import PropertyBased

@Suite struct PropertyCheckTests {
    @Test func testFunctionIsCalledWithInputs() async {
        let mutex = Mutex((a: 0, b: 0))
        
        await propertyCheck(input: .bool) { bool in
            mutex.withLock {
                if bool {
                    $0.a += 1
                } else {
                    $0.b += 1
                }
            }
        }
        
        let counts = mutex.withLock { $0 }
        #expect(counts.a > 0 && counts.b > 0)
        #expect(counts.a + counts.b == 100)
    }
    
    @Test func testCountParameter() async {
        await confirmation(expectedCount: 12) { confirm in
            await propertyCheck(count: 12) {
                confirm()
            }
        }
        
        await confirmation(expectedCount: 7) { confirm in
            await propertyCheck(count: 7) {
                confirm()
            }
        }
    }
    
    @Test func testIssuesArePropagated() async {
        let issues = await gatherIssues {
            await propertyCheck(input: .int(in: 0...10)) { a in
                try #require(a > 20)
                #expect(a > 50)
            }
        }
        
        #expect(issues.contains(where: {
            $0.description.contains("> 20")
        }))
        #expect(issues.contains(where: {
            $0.description.contains("to reproduce this issue")
        }))
        
        #expect(!issues.contains(where: {
            $0.description.contains("> 50")
        }))
    }
}
