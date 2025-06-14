//
//  Shrink+Optional.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 11/05/2025.
//

extension Shrink {
    /// Shrink an optional value by mapping the values of another sequence, then appending a `nil` at the end.
    public struct WithNil<S: Sequence>: Sequence {
        public typealias Element = S.Element?

        @usableFromInline let sequence: S?

        /// Construct a new sequence.
        /// - Parameter sequence: The sequence to map. If this parameter is `nil`, the resulting sequence is empty.
        public init(_ sequence: S?) {
            self.sequence = sequence
        }

        public func makeIterator() -> Iterator {
            return Iterator(iterator: sequence?.makeIterator())
        }

        public struct Iterator: IteratorProtocol {
            @usableFromInline var iterator: S.Iterator?

            public mutating func next() -> Element? {
                guard var iterator else { return .none }

                if let element = iterator.next() {
                    self.iterator = iterator
                    return .some(element)
                }

                self.iterator = nil
                return .some(nil)
            }
        }

    }
}
