//
//  ShrinkTests+Integer.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

import PropertyBased
import Testing

@Suite struct ShrinkBitsetTests {
    @Test func testShrinkUInt() async throws {
        let start = 0b11001010 as UInt32
        let results = Array(Shrink.Bitwise(start))

        #expect(
            results == [
                0b11001000,
                0b11000010,
                0b10001010,
                0b01001010,
            ])
    }

    @Test func testShrinkNegativeInt() async throws {
        let start = -31 as Int8
        let results = Array(Shrink.Bitwise(start))

        #expect(results == [-32, -63, -95, 97])
    }

    @Test func testShrinkZero() async throws {
        let results = Array(Shrink.Bitwise(0))
        #expect(results.isEmpty)
    }
}
