//
//  Utils.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import Testing

@testable import PropertyBased

func gatherIssues(block: @Sendable () async throws -> Void) async -> [String] {
    let mutex = Mutex([] as [String])

    // No way to stop issues from still being recorded. Ignore those for now.
    await withKnownIssue(isIntermittent: true) {
        do {
            try await block()
        } catch {
            Issue.record(error)
        }
    } matching: { issue in
        mutex.withLock { $0.append(issue.description) }
        return true
    }

    return mutex.withLock { $0 }
}

struct PairwiseSequence<Base: Sequence>: Sequence {
    typealias Element = (Base.Element, Base.Element)
    let base: Base

    func makeIterator() -> Iterator {
        Iterator(base: base.makeIterator())
    }

    struct Iterator: IteratorProtocol {
        var base: Base.Iterator
        var prev: Base.Element?

        mutating func next() -> Element? {
            if prev == nil {
                prev = base.next()
            }
            guard let prev, let next = base.next() else { return nil }
            defer { self.prev = next }
            return (prev, next)
        }
    }
}

extension Sequence {
    func pairwise() -> PairwiseSequence<Self> {
        PairwiseSequence(base: self)
    }
}

func testGen<T: Hashable & Sendable>(_ gen: Generator<T, some Sequence>) async {
    let fullSet = Mutex(Set<T>())
    await propertyCheck(count: 200, input: gen) { item in
        #expect(item == item)
        fullSet.withLock { _ = $0.insert(item) }
    }

    let count = fullSet.withLock { $0.count }
    #expect(count > 50)

    var rng = Xoshiro() as any SeededRandomNumberGenerator
    let value = gen._runIntermediate(&rng)
    gen._shrinker(value).reduce(into: ()) { _, _ in }
}
