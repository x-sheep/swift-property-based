//
//  GenTests+Collection.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 26/05/2025.
//

import Testing

@testable import PropertyBased

@Suite struct GenCollectionTests {
    enum Direction: CaseIterable { case north, south, west, east }

    @Test func testConstantCollection() async {
        let items = [1, 20, 50, 100]
        await propertyCheck(input: Gen.element(of: items)) { el in
            #expect(items.contains(where: { $0 == el }))
        }

        await propertyCheck(input: Gen.shuffled(items)) { list in
            try #require(list.count == items.count)
            #expect(items.allSatisfy { el in list.contains(where: { $0 == el }) })
        }

        await propertyCheck(input: Gen<Direction>.case) { el in
            #expect(Direction.allCases.contains(where: { $0 == el }))
        }
    }

    @Test func testGenerateArrayVariableSize() async throws {
        let gen = Gen.int(in: 0..<100).array(of: 5...50)
        var rng = Xoshiro()
        var items: [Int] = []
        while items.count < 6 {
            items = gen.run(using: &rng)
        }

        #expect(items.count >= 5 && items.count <= 50)

        let shrunk = Array(gen._shrinker(items))
        #expect(shrunk.contains(where: { $0.count == items.count - 1 }))

        let item = try #require(gen.element.run(using: &rng))
        #expect(0..<100 ~= item)
    }

    @Test func testGenerateArrayFixedSize() async {
        let gen = Gen.int().array(of: 8)
        var rng = Xoshiro()
        let items = gen.run(using: &rng)

        #expect(items.count == 8)

        let shrunk = Array(gen._shrinker(items))
        #expect(shrunk.allSatisfy { $0.count == 8 })
    }

    @Test func testGenerateOtherCollections() async {
        await propertyCheck(input: Gen.int().set(ofAtMost: 8)) { col in
            #expect(col.count <= 8)
        }

        await propertyCheck(input: zip(Gen.int(), Gen.bool).dictionary(ofAtMost: 8)) { col in
            #expect(col.count <= 8)
        }

        await propertyCheck(input: zip(Gen.bool(), Gen.int()).dictionary(ofAtMost: 8)) { col in
            #expect(col.count <= 2)
        }
    }
}
