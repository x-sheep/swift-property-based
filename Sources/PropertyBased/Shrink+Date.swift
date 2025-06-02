//
//  Shrink+Date.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 30/05/2025.
//

#if canImport(Foundation)
import Foundation

extension Shrink {
    /// Shrink a TimeInterval by rounding to seconds, then minutes, then 15 minute intervals.
    public struct TruncateTime: Sequence, IteratorProtocol, Sendable, BitwiseCopyable {
        public init(_ value: TimeInterval, roundUp: Bool) {
            self.value = value
            self.roundUp = roundUp
        }
        
        public var value: TimeInterval
        public let roundUp: Bool
        
        public mutating func next() -> TimeInterval? {
            let rounding: FloatingPointRoundingRule = roundUp ? .up : .down
            
            let withoutMillis = value.rounded(rounding)
            if withoutMillis != value {
                value = withoutMillis
                return withoutMillis
            }
            
            let withoutSeconds = (value / 60).rounded(rounding) * 60
            if withoutSeconds != value {
                value = withoutSeconds
                return withoutSeconds
            }
            
            let quarter = (value / (60*15)).rounded(rounding) * (60 * 15)
            if quarter != value {
                value = quarter
                return quarter
            }
            
            return nil
        }
    }
}

#endif
