//
//  GenTests+SIMD.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 21/05/2025.
//

import Testing

@testable import PropertyBased

#if canImport(simd)
import simd
#endif

@Suite struct GemSIMDTests {
    @Test func testSIMD2() async {
        let gen = Gen.float(in: 0...1).simd2
        await confirmation(expectedCount: 90...) { confirm in
            await propertyCheck(input: gen) { simd in
                if simd.x != simd.y {
                    confirm()
                }
            }
        }
    }

    @Test func testSIMD3() async {
        let gen = Gen.float(in: 0...1).simd3
        await confirmation(expectedCount: 90...) { confirm in
            await propertyCheck(input: gen) { simd in
                if simd.x != simd.y && simd.y != simd.z {
                    confirm()
                }
            }
        }
    }

    @Test func testSIMD4() async {
        let gen = Gen.float(in: 0...1).simd4
        await confirmation(expectedCount: 90...) { confirm in
            await propertyCheck(input: gen) { simd in
                if simd.x != simd.y && simd.y != simd.z && simd.z != simd.w {
                    confirm()
                }
            }
        }
    }

    func unitVectorCheck<T: SIMD & Sendable>(_ gen: Generator<T, some Sequence>) async
    where T.Scalar: FloatingPoint & ExpressibleByFloatLiteral {
        await testGen(gen)
        await propertyCheck(input: gen) { vec in
            #expect(length(vec).isApproximately(1))
        }
    }

    @Test func testUnitVectorFloat2() async {
        await unitVectorCheck(Gen<SIMD2<Float>>.unitVector)
    }
    @Test func testUnitVectorFloat3() async {
        await unitVectorCheck(Gen<SIMD3<Float>>.unitVector)
    }
    @Test func testUnitVectorFloat4() async {
        await unitVectorCheck(Gen<SIMD4<Float>>.unitVector)
    }
    @Test func testUnitVectorDouble2() async {
        await unitVectorCheck(Gen<SIMD2<Double>>.unitVector)
    }
    @Test func testUnitVectorDouble3() async {
        await unitVectorCheck(Gen<SIMD3<Double>>.unitVector)
    }
    @Test func testUnitVectorDouble4() async {
        await unitVectorCheck(Gen<SIMD4<Double>>.unitVector)
    }

    @Test func testVectorLength() {
        #expect(!length([2, 0] as SIMD2<Float>).isApproximately(1))
        #expect(length([3, 0] as SIMD2<Float>).isApproximately(3))
        #expect(length([3, 0, 0] as SIMD3<Float>).isApproximately(3))
        #expect(length([3, 0, 0] as SIMD3<Float>).isApproximately(3))
        #expect(length([3, 4] as SIMD2<Float>).isApproximately(5))
        #expect(length([2, 4, 6] as SIMD3<Float>).isApproximately(7.483315))
    }

    #if canImport(simd)
    @Test func testQuatF() async {
        await testGen(Gen.simd_quatf)
        await propertyCheck(input: Gen.simd_quatf) { quat in
            #expect(quat.length.isApproximately(1))
        }
    }
    @Test func testQuatD() async {
        await testGen(Gen.simd_quatd)
        await propertyCheck(input: Gen.simd_quatd) { quat in
            #expect(quat.length.isApproximately(1))
        }
    }
    #endif
}

extension FloatingPoint where Self: ExpressibleByFloatLiteral {
    func isApproximately(_ other: Self, tolerance: Self = 0.001) -> Bool {
        return abs(self - other) < tolerance
    }
}
