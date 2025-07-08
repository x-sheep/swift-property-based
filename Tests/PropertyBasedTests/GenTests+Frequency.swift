//
//  GenTests+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 08/07/2025.
//

#if compiler(>=6.2)
import Testing
@testable import PropertyBased

@Suite struct GenFrequencyTests {
    enum Choice: Hashable {
        case plain
        case number(Int)
        case text(String)
    }

    let gen = Gen.oneOf(
        Gen.always(Choice.plain),
        Gen.int().map(Choice.number),
        Gen.lowercaseLetter.string(of: 8).map(Choice.text),
    )

    @Test func testGenerateEnum() async {
        await testGen(gen)

        await confirmation(expectedCount: 1...) { confirm1 in
            await confirmation(expectedCount: 1...) { confirm2 in
                await confirmation(expectedCount: 1...) { confirm3 in
                    await propertyCheck(count: 200, input: gen) { item in
                        switch item {
                        case .plain:
                            confirm1()
                        case .number:
                            confirm2()
                        case .text:
                            confirm3()
                        }
                    }
                }
            }
        }
    }

    @Test func testShrinkChoice() async throws {
        let value = (index: 1, value: 500 as Any)
        let results = gen._shrinker(value).compactMap(gen._mapFilter)
        try #require(results.count > 1)
        #expect(results.first == .number(0))
        #expect(!results.contains(.number(500)))
    }
}
#endif  // compiler(>=6.2)
