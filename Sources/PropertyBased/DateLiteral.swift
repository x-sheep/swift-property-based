//
//  DateLiteral.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 17/10/2025.
//

#if canImport(Foundation)
import Foundation

extension Calendar {
    static var neutral: Calendar {
        var cal = Calendar(identifier: .iso8601)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal
    }
}

let dateFormats = [
    "yyyy-MM-dd",
    "yyyy-MM-dd'T'HH:mm:ss",
    "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
    "yyyy-MM-dd'T'HH:mm:ss.SSS",
    "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
]

/// A helper type that allows creating dates using string literals.
///
/// Dates are ISO8601-formatted strings. The date components are required, while the time and offset components are optional.
///
/// ## Examples
/// ```swift
/// let date: DateLiteral = "2025-01-30"
/// let dateTime: DateLiteral = "2020-01-20T16:00:00"
/// ```
public struct DateLiteral: RawRepresentable, Sendable {
    public init(rawValue: Date) {
        self.rawValue = rawValue
    }
    public let rawValue: Date
}

extension DateLiteral: Comparable {
    public static func < (lhs: DateLiteral, rhs: DateLiteral) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension DateLiteral: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let formatter = DateFormatter()
        formatter.calendar = .neutral
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)

        for format in dateFormats {
            formatter.dateFormat = format
            if let date = formatter.date(from: value) {
                rawValue = date
                return
            }
        }

        preconditionFailure("\(value) is not a valid ISO 8601 date")
    }
}

#endif
