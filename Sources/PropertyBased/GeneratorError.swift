//
//  GeneratorError.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 13/08/2026.
//

#if canImport(Foundation)
import Foundation
#endif

/// Errors that may be thrown by a generator.
public enum GeneratorError: Equatable, Error, CustomStringConvertible {
    /// A generator failed to generate a valid value within the specified amount of attempts.
    case runLimitExceeded(Int)

    public var description: String {
        switch self {
        case .runLimitExceeded(let count):
            "Failed to generate a valid input after \(count) attempts. Check if the Generator is filtering too many values."
        }
    }
}

#if canImport(Foundation)
extension GeneratorError: LocalizedError {
    public var localizedDescription: String { description }
}
#endif
