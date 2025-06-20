//
//  ShrinkTests+Date.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 31/05/2025.
//

#if canImport(Foundation)
import Testing
import Foundation
@testable import PropertyBased

@Suite struct GenDateTests {
    @Test func testGenerateDateTime() async {
        await testGen(Gen.dateTime)
    }

    @Test func testGenerateDateWithoutTime() async {
        await testGen(Gen.date)

        await propertyCheck(input: Gen.date) { date in
            let components = Calendar.neutral.dateComponents([.hour, .minute, .second], from: date)
            #expect(components.hour == 0)
            #expect(components.minute == 0)
            #expect(components.second == 0)
        }
    }

    @Test func testGenerateDateInYear() async {
        await testGen(Gen.date(inYear: 2020))
        await propertyCheck(input: Gen.date(inYear: 2020)) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year == 2020)
        }
    }

    @Test func testGenerateDateTimeInYear() async {
        await testGen(Gen.dateTime(inYear: 2020))
        await propertyCheck(input: Gen.dateTime(inYear: 2020)) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year == 2020)
        }
    }

    @Test(.shrinking) func testGenerateYears() async {
        await propertyCheck(input: Gen.year(in: 2015...)) { year in
            #expect(year >= 2015)
        }
        await propertyCheck(input: Gen.year(in: ...2030)) { year in
            #expect(year <= 2030)
        }
        await propertyCheck(input: Gen.year(in: .min ... .max)) { year in
            #expect(abs(year - 2025) < 100)
        }
        await propertyCheck(input: Gen.year) { year in
            #expect(abs(year - 2025) < 100)
        }
    }

    @Test func testGenerateDateLiterals() async throws {
        let date = try #require(DateComponents(calendar: .neutral, year: 2019, month: 4, day: 15).date)
        try #require(date == "2019-04-15")

        await propertyCheck(input: Gen.date(in: "2020-01-20"...)) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year >= 2020)
        }

        await propertyCheck(input: Gen.date(in: ..."2020-01-20T16:00:00+08:00")) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year <= 2020)
        }

        await propertyCheck(input: Gen.date(in: "2022-12-25"..<"2023-01-01")) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year == 2022)
        }

        await propertyCheck(input: Gen.date(in: ..<"2023-01-01")) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year < 2023)
        }
    }

    @Test func testGenerateDateTimeLiterals() async {
        await propertyCheck(input: Gen.dateTime(in: "2020-01-20"...)) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year >= 2020)
        }

        await propertyCheck(input: Gen.dateTime(in: ..<"2020-01-20T16:00:00+08:00")) { date in
            let year = Calendar.neutral.component(.year, from: date)
            #expect(year <= 2020)
        }
    }
}
#endif
