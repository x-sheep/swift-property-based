//
//  Date+String.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 31/05/2025.
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

extension Date: @retroactive ExpressibleByStringLiteral {
    /// Create a date from a ISO8601-formatted string.
    ///
    /// The date components are required. The time and offset components are optional.
    ///
    /// This initializer exists as a convenience for creating date ranges. It is not recommended for use in a production environment.
    /// 
    /// - Parameter value: The string to parse.
    public init(stringLiteral value: String) {
        let formatter = DateFormatter()
        formatter.calendar = .neutral
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        for format in dateFormats {
            formatter.dateFormat = format
            if let date = formatter.date(from: value) {
                self = date
                return
            }
        }
        
        fatalError("\(value) is not a valid ISO 8601 date")
    }
}

#endif
