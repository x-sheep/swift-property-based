//
//  Gen+Date.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 30/05/2025.
//

#if canImport(Foundation)
import Foundation

// This value is a constant, to keep test runs reproducible.
// This value may only be changed between package releases.
let defaultYear = 2025
let yearWindow = 60

@usableFromInline let defaultYearRange = (defaultYear - yearWindow)...(defaultYear + yearWindow)
let preferredDistanceFromNow: TimeInterval = 60 * 20
let secondsPerDay: TimeInterval = 60 * 60 * 24

extension Gen where Value == Int {
    /// A generator that creates random integers that represent years.
    ///
    /// This is a convenience function that creates integers, and shrinks them closer to the current year.
    /// The default range is between 60 years in the past and 60 years in the future.
    ///
    /// ## See Also
    /// - ``year(in:)``
    @inlinable public static var year: Generator<Int, Shrink.Integer<Int>> {
        year(in: defaultYearRange)
    }

    /// A generator that creates random integers that represent years.
    ///
    /// This is a convenience function that creates integers, and shrinks them closer to the current year.
    /// The default range is between approximately 60 years in the past and 60 years in the future.
    /// - Parameter range: The range in which to create a random value. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func year(in range: some RangeExpression<Int>) -> Generator<Int, Shrink.Integer<Int>> {
        let actualRange = ClosedRange(years: range)
        let currentYear = Calendar.current.component(.year, from: Date())

        return .init(
            run: { rng in Int.random(in: actualRange, using: &rng) },
            shrink: { $0.shrink(towards: currentYear) }
        )
    }
}

extension Gen where Value == Date {
    @_documentation(visibility: internal)
    public typealias DateTimeShrink = Shrink.Appended<Shrink.Floating<TimeInterval>, Shrink.TruncateTime>

    /// A generator that creates dates with time components.
    ///
    /// The default range is between approximately 60 years in the past and 60 years in the future.
    @inlinable public static var dateTime: Generator<Date, DateTimeShrink> {
        dateTime(inYear: defaultYearRange)
    }

    /// A generator that creates dates with time components.
    /// - Parameter year: The year which contains all generated dates.
    /// - Returns: A new generator.
    @inlinable public static func dateTime(inYear year: Int) -> Generator<Date, DateTimeShrink> {
        return dateTime(inYear: year...year)
    }

    /// A generator that creates dates with time components.
    /// - Parameter range: A range of years that contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func dateTime(inYear range: some RangeExpression<Int>) -> Generator<Date, DateTimeShrink> {
        let actualRange = ClosedRange(years: range)

        guard let lower = DateComponents(calendar: .neutral, year: actualRange.lowerBound, month: 1, day: 1).date,
            let upper = DateComponents(calendar: .neutral, year: actualRange.upperBound + 1, month: 1, day: 1).date
        else {
            fatalError("dateTime(inYear:) got invalid year range: \(range)")
        }

        return dateTime(in: lower..<upper)
    }

    /// A generator that creates dates with time components.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.dateTime(in: "2024-01-01"...)
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func dateTime(in range: PartialRangeFrom<Date>) -> Generator<Date, DateTimeShrink> {
        let upper = Calendar.neutral.date(byAdding: .year, value: yearWindow, to: range.lowerBound)!
        return dateTime(in: range.lowerBound..<upper)
    }

    /// A generator that creates dates with time components.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.dateTime(in: ..<"2025-01-01")
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func dateTime(in range: PartialRangeUpTo<Date>) -> Generator<Date, DateTimeShrink> {
        let lower = Calendar.neutral.date(byAdding: .year, value: -yearWindow, to: range.upperBound)!
        return dateTime(in: lower..<range.upperBound)
    }

    /// A generator that creates dates with time components.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.dateTime(in: "2024-01-01" ..< "2025-01-01")
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func dateTime(in range: Range<Date>) -> Generator<Date, DateTimeShrink> {
        let interval = range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate
        let end = Date().timeIntervalSinceReferenceDate

        return .init(
            run: { rng in TimeInterval.random(in: interval, using: &rng) },
            shrink: {
                let seq =
                    abs($0.distance(to: end)) > preferredDistanceFromNow
                    ? $0.shrink(within: interval, towards: end) : nil
                return Shrink.Appended(first: seq, second: Shrink.TruncateTime($0, roundUp: end > $0))
            },
            finalResult: { Date(timeIntervalSinceReferenceDate: $0) }
        )
    }
}

extension Gen where Value == Date {
    /// A generator that creates dates without time components, in the UTC timezone.
    ///
    /// The default range is between approximately 60 years in the past and 60 years in the future.
    @inlinable public static var date: Generator<Date, Shrink.Integer<Int>> {
        date(inYear: defaultYearRange)
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    /// - Parameter year: The year which contains all generated dates.
    /// - Returns: A new generator.
    @inlinable public static func date(inYear year: Int) -> Generator<Date, Shrink.Integer<Int>> {
        return date(inYear: year...year)
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    /// - Parameter range: A range of years that contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func date(inYear range: some RangeExpression<Int>) -> Generator<Date, Shrink.Integer<Int>> {
        let actualRange = ClosedRange(years: range)

        guard let lower = DateComponents(calendar: .neutral, year: actualRange.lowerBound, month: 1, day: 1).date,
            let upper = DateComponents(calendar: .neutral, year: actualRange.upperBound, month: 12, day: 31).date
        else {
            fatalError("date(inYear:) got invalid year range: \(range)")
        }

        return date(in: lower...upper)
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.date(in: "2024-01-01"...)
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func date(in range: PartialRangeFrom<Date>) -> Generator<Date, Shrink.Integer<Int>> {
        let upper = Calendar.neutral.date(byAdding: .year, value: yearWindow, to: range.lowerBound)!
        return date(in: range.lowerBound...upper)
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.date(in: ..<"2024-01-01")
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func date(in range: PartialRangeUpTo<Date>) -> Generator<Date, Shrink.Integer<Int>> {
        let newUpper = range.upperBound.timeIntervalSinceReferenceDate - secondsPerDay
        return date(in: ...Date(timeIntervalSinceReferenceDate: newUpper))
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.date(in: ..."2024-01-01")
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func date(in range: PartialRangeThrough<Date>) -> Generator<Date, Shrink.Integer<Int>> {
        let lower = Calendar.neutral.date(byAdding: .year, value: -yearWindow, to: range.upperBound)!
        return date(in: lower...range.upperBound)
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.date(in: "2024-01-01" ..< "2025-01-01")
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func date(in range: Range<Date>) -> Generator<Date, Shrink.Integer<Int>> {
        let newUpper = range.upperBound.timeIntervalSinceReferenceDate - secondsPerDay
        return date(in: range.lowerBound...Date(timeIntervalSinceReferenceDate: newUpper))
    }

    /// A generator that creates dates without time components, in the UTC timezone.
    ///
    /// Dates can be passed in directly, or written as string literals in ISO 8601 format:
    ///
    /// ```swift
    /// Gen.date(in: "2024-01-01" ... "2025-12-31")
    /// ```
    /// - Parameter range: A range which contains all generated dates. Undefined bounds will be set to 60 years from the other bound.
    /// - Returns: A new generator.
    public static func date(in range: ClosedRange<Date>) -> Generator<Date, Shrink.Integer<Int>> {
        let interval =
            Int(
                range.lowerBound.timeIntervalSinceReferenceDate / secondsPerDay)...Int(
                range.upperBound.timeIntervalSinceReferenceDate / secondsPerDay)
        let end = Int(Date().timeIntervalSinceReferenceDate / secondsPerDay)

        return .init(
            run: { rng in Int.random(in: interval, using: &rng) },
            shrink: { $0.shrink(within: interval, towards: end) },
            finalResult: { Date(timeIntervalSinceReferenceDate: TimeInterval($0) * secondsPerDay) }
        )
    }
}

extension ClosedRange where Bound == Int {
    @usableFromInline init(years range: some RangeExpression<Bound>) {
        let fullRange = ClosedRange(range)

        switch (fullRange.lowerBound, fullRange.upperBound) {
        case (.min, .max):
            self = defaultYearRange
        case (.min, _):
            self = fullRange.upperBound - yearWindow...fullRange.upperBound
        case (_, .max):
            self = fullRange.lowerBound...fullRange.lowerBound + yearWindow
        default:
            self = fullRange
        }
    }
}

#endif
