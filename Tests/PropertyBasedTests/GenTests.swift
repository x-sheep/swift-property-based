//
//  GenTests+Color.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 20/05/2025.
//

import Testing

@testable import PropertyBased

@Suite struct GenTests {
    @Test func testGenAlways() async {
        await propertyCheck(input: Gen.always(360)) { item in
            #expect(item == 360)
        }
    }

    @Test func testGenerateFloat16() async {
        await testGen(Gen.float16(in: 0...1))
        await testGen(Gen.float16(in: 0..<1))
    }
    @Test func testGenerateFloat32() async {
        await testGen(Gen.float(in: 0...1))
        await testGen(Gen.float(in: 0..<1))
    }
    @Test func testGenerateFloat64() async {
        await testGen(Gen.double(in: 0...1))
        await testGen(Gen.double(in: 0..<1))
    }

    @Test func testGenerateInt() async { await testGen(Gen.int()) }
    @Test func testGenerateInt8() async { await testGen(Gen.int8()) }
    @Test func testGenerateInt16() async { await testGen(Gen.int16()) }
    @Test func testGenerateInt32() async { await testGen(Gen.int32()) }
    @Test func testGenerateInt64() async { await testGen(Gen.int64()) }
    @Test func testGenerateUInt() async { await testGen(Gen.uint()) }
    @Test func testGenerateUInt8() async { await testGen(Gen.uint8()) }
    @Test func testGenerateUInt16() async { await testGen(Gen.uint16()) }
    @Test func testGenerateUInt32() async { await testGen(Gen.uint32()) }
    @Test func testGenerateUInt64() async { await testGen(Gen.uint64()) }

    @available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
    @Test func testGenerateInt128() async { await testGen(Gen.int128()) }
    @available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
    @Test func testGenerateUInt128() async { await testGen(Gen.uint128()) }

    #if canImport(CoreGraphics)
    @Test func testGenerateCgFloat() async {
        await testGen(Gen.cgFloat(in: 0..<1))
        await testGen(Gen.cgFloat(in: 0...1))
    }
    @Test func testGenerateCgColor() async { await testGen(Gen.cgColor) }
    #endif

    #if os(iOS)
    @Test func testGenerateUiColor() async { await testGen(Gen.uiColor) }
    #elseif os(macOS)
    @Test func testGenerateNsColor() async { await testGen(Gen.nsColor) }
    #endif

    @available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
    @Test func testGenerateDuration() async { await testGen(Gen.duration(in: .zero ... .seconds(60))) }

    @available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
    @Test func testDurationRoundtrip() async {
        await propertyCheck(input: Gen.duration(in: (.zero - .seconds(60)) ... .seconds(60))) { duration in
            #expect(Duration(duration.int128) == duration)
        }

        let edge: Int128 = 0xf_ffff_ffff_ffff_ffff_ffff

        #expect(Duration(edge).int128 == edge)

        await propertyCheck(input: Gen.int128(in: -edge...edge)) { int in
            #expect(Duration(int).int128 == int)
        }
    }

    @Test func testGenerateOptional() async {
        let gen = Gen.int().optional

        await testGen(gen)

        await confirmation(expectedCount: 1...) { confirm in
            await propertyCheck(count: 200, input: gen) { item in
                if item == nil {
                    confirm()
                }
            }
        }
    }

    enum CustomError: Hashable, Error {
        case one
    }

    @Test func testGenerateAsResult() async {
        let successGen = Gen.int()
        let errorGen = Gen.always(CustomError.one)

        let gen = successGen.asResult(withFailure: errorGen)

        await testGen(gen)

        await confirmation(expectedCount: 1...) { confirm in
            await propertyCheck(count: 200, input: gen) { item in
                if case .failure = item {
                    confirm()
                }
            }
        }
    }

    @Test func testEraseToAnySequence() async {
        let gen1 = Gen.int()
        let gen2 = gen1.eraseToAnySequence()

        let seq1 = Array(gen1._shrinker(50))
        let seq2 = Array(gen2._shrinker(50))

        #expect(seq1 == seq2)
    }

    struct CustomOptionSet: OptionSet, Hashable, Sendable {
        var rawValue: UInt
    }

    @Test func testGenerateOptionSet() async {
        await testGen(Gen<CustomOptionSet>.optionSet)
    }
}
