//
//  GenTests+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 08/07/2025.
//

import Testing

@testable import PropertyBased

#if swift(>=6.2)
@Suite struct GenFrequencyTests {
    enum Choice: Hashable {
        case plain
        case number(Int)
        case text(String)
    }

    // MARK: oneOf

    static let unpackedGen = Gen.oneOf(
        Gen.always(Choice.plain).eraseToAny(),
        Gen.int().map(Choice.number).eraseToAny(),
        Gen.lowercaseLetter.string(of: 8).map(Choice.text).eraseToAny(),
    )

    static let packedGen = Gen.oneOf(
        Gen.always(Choice.plain),
        Gen.int().map(Choice.number),
        Gen.lowercaseLetter.string(of: 8).map(Choice.text),
    )

    static let generators = [(0, unpackedGen), (1, packedGen)]

    @Test(arguments: generators)
    func testGenerateEnum(_ pair: (Int, Generator<Choice, AnySequence<(index: Int, value: Any)>>)) async {
        let gen = pair.1
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

    @Test(arguments: generators)
    func testShrinkChoice(_ pair: (Int, Generator<Choice, AnySequence<(index: Int, value: Any)>>)) async throws {
        let gen = pair.1
        let value = (index: 1, value: 500 as Any)
        let results = gen._shrinker(value).compactMap(gen._mapFilter)
        try #require(results.count > 1)
        #expect(results.first == .number(0))
        #expect(!results.contains(.number(500)))
    }

    // MARK: frequency

    static let unpackedFreqGen = Gen<Choice>.frequency([
        (1, Gen.int().map(Choice.number).eraseToAny()),
        (2.0, Gen.lowercaseLetter.string(of: 8).map(Choice.text).eraseToAny()),
        (0, Gen.always(Choice.plain).eraseToAny()),
    ])

    static let packedFreqGen = Gen.frequency(
        (1, Gen.int().map(Choice.number)),
        (2, Gen.lowercaseLetter.string(of: 8).map(Choice.text)),
        (0, Gen.always(Choice.plain)),
    )
    static let freqGenerators = [(0, unpackedFreqGen), (1, packedFreqGen)]

    @Test(arguments: freqGenerators)
    func testGenerateWithFrequency(_ pair: (Int, Generator<Choice, AnySequence<(index: Int, value: Any)>>)) async {
        let gen = pair.1
        await testGen(gen)

        await propertyCheck(count: 200, input: gen) { item in
            #expect(item != .plain)
        }
    }
}
#endif
