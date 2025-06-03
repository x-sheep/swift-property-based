//
//  GenTests+SIMD.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 21/05/2025.
//

import PropertyBased
import Testing

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

    #if canImport(simd)
    @Test func testUnitVectorFloat2() async {
        await propertyCheck(input: Gen<simd_float2>.unitVector) { vec in
            #expect(abs(length(vec) - 1) < 0.0001)
        }
    }
    @Test func testUnitVectorFloat3() async {
        await propertyCheck(input: Gen<simd_float3>.unitVector) { vec in
            #expect(abs(length(vec) - 1) < 0.0001)
        }
    }
    @Test func testUnitVectorFloat4() async {
        await propertyCheck(input: Gen<simd_float4>.unitVector) { vec in
            #expect(abs(length(vec) - 1) < 0.0001)
        }
    }
    @Test func testUnitVectorDouble2() async {
        await propertyCheck(input: Gen<simd_double2>.unitVector) { vec in
            #expect(abs(length(vec) - 1) < 0.0001)
        }
    }
    @Test func testUnitVectorDouble3() async {
        await propertyCheck(input: Gen<simd_double3>.unitVector) { vec in
            #expect(abs(length(vec) - 1) < 0.0001)
        }
    }
    @Test func testUnitVectorDouble4() async {
        await propertyCheck(input: Gen<simd_double4>.unitVector) { vec in
            #expect(abs(length(vec) - 1) < 0.0001)
        }
    }

    @Test func testQuatF() async {
        await propertyCheck(input: Gen.simd_quatf) { quat in
            #expect(abs(quat.length - 1) < 0.0001)
        }
    }
    @Test func testQuatD() async {
        await propertyCheck(input: Gen.simd_quatd) { quat in
            #expect(abs(quat.length - 1) < 0.0001)
        }
    }
    #endif
}
