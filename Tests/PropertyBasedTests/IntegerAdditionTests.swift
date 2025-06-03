//
//  IntegerAdditionTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import PropertyBased
import Testing

let randomInt = Gen.int(in: -100000...100000)

/// A simple example of testing an operation by its properties.
@Suite struct IntegerAdditionTests {

    @Test func testIdentity() async {
        await propertyCheck(input: randomInt) { a in
            #expect(a + 0 == a)
        }
    }

    // @PropertyTest(input: randomInt) func testIdentity(a: Int) async {
    //     #expect(a + 0 == a)
    // }

    @Test func testCommutativity() async {
        await propertyCheck(input: randomInt, randomInt) { a, b in
            #expect(a + b == b + a)
        }
    }

    @Test func testAssociativity() async {
        await propertyCheck(input: randomInt, randomInt, randomInt) { a, b, c in
            let first = (a + b) + c
            let second = a + (b + c)

            #expect(first == second)
        }
    }
}
