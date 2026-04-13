//
//  WarningTests.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/04/2026.
//

#if swift(>=6.3)
import Testing

@testable import PropertyBased

@Suite struct WarningTests {
    @Test func testWarningIssues() async {
        let count = await countIssues(suppress: true) {
            await propertyCheck(input: Gen.int(in: 0...100)) { i in
                if i > 10 {
                    Issue.record("Above 10", severity: .warning)
                }
            }
        }

        #expect(count.errors == 0)
        #expect(count.warnings > 0)

        let texts = await gatherIssues {
            await propertyCheck(input: Gen.int(in: 0...100)) { i in
                if i > 10 {
                    Issue.record("Above 10", severity: .warning)
                }
            }
        }

        #expect(
            texts.contains(where: {
                $0.contains("Warning")
            }))
    }

    @Test func testErrorSupersedesWarning() async {
        // Don't fail the rare case where the very first iteration is zero
        let mutex = Mutex(false)

        let count = await countIssues(suppress: true) {
            await propertyCheck(input: Gen.int(in: 0...1_000_000)) { i in
                let wasAboveTen = mutex.withLock {
                    if i > 10 {
                        $0 = true
                    }
                    return $0
                }

                if wasAboveTen {
                    #expect(i > 0)
                }
                if i > 10 {
                    Issue.record("Above 10", severity: .warning)
                }
            }
        }

        #expect(count.errors > 0)
        #expect(count.warnings == 0)
    }

    @Test func testFixedSeedUpgradesWarnings() async {
        let count = await countIssues(suppress: true) {
            await FixedSeedTrait.fixedSeed(
                16_227_743_274_320_082_944, 3_104_485_330_390_707_246, 16_893_853_035_950_354_083,
                9_960_939_931_137_502_728
            ).provideScope(for: .current!, testCase: .current) {
                await propertyCheck(input: Gen.int(in: 0...100)) { i in
                    if i > 10 {
                        Issue.record("Above 10", severity: .warning)
                    }
                }
            }
        }

        #expect(count.errors > 0)
        #expect(count.warnings == 0)
    }
}
#endif
