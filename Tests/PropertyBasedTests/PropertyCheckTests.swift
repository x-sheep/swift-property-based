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
        
        await propertyCheck(input: Gen.bool) { bool in
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
            await propertyCheck(count: 12, input: Gen.bool) { _ in
                confirm()
            }
        }
        
        await confirmation(expectedCount: 7) { confirm in
            await propertyCheck(count: 7, input: Gen.bool) { _ in
                confirm()
            }
        }
    }
    
    @Test func testEmptyCountParameter() async {
        await confirmation(expectedCount: 0) { confirm in
            await propertyCheck(count: 0, input: Generator {
                _ in confirm();
                return false
            }) { _ in
            }
        }
    }
    
    @Test func testIssuesArePropagated() async {
        let issues = await gatherIssues {
            await propertyCheck(input: Gen.int(in: 0...10)) { a in
                try #require(a > 20)
                #expect(a > 50)
            }
        }
        
        #expect(issues.contains(where: {
            $0.contains("> 20")
        }))
        #expect(issues.contains(where: {
            $0.contains("to reproduce this issue")
        }))
        
        #expect(!issues.contains(where: {
            $0.contains("> 50")
        }))
    }
    
    @Test(.shrinking(false)) func testShrinkDisabled() {
        #expect(!EnableShrinkTrait.isEnabled)
    }
    
    @Test(.shrinking) func testShrinkUsed() async {
        let issues = await gatherIssues {
            await FixedSeedTrait.fixedSeed(25466932810665158, 1321246059880845604, 5313745855673549824, 1730655706999845731).provideScope(for: .current!, testCase: .current) {
                await propertyCheck(input: Gen.int(in: 0...100)) { i in
                    #expect(i == 0)
                }
            }
        }
        
        #expect(issues.contains(where: {
            $0.contains("with input 1")
        }))
        #expect(issues.contains(where: {
            $0.contains("shrunk down from")
        }))
    }
}
