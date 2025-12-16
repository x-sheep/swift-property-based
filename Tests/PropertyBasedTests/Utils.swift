//
//  Utils.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import Testing

@testable import PropertyBased

func gatherIssues(isolation: isolated (any Actor)? = #isolation, block: () async throws -> Void) async -> [String] {
    let mutex = Mutex([] as [String])

    #if swift(>=6.2)
    nonisolated(unsafe) let closure = block

    let handler = IssueHandlingTrait.filterIssues { issue in
        mutex.withLock { $0.append(issue.description) }
        return false
    }

    try? await handler.provideScope(for: Test.current!, testCase: Test.Case.current) {
        try await run(closure, in: isolation)
    }
    #else
    await withKnownIssue(isIntermittent: true, isolation: isolation) {
        do {
            try await block()
        } catch {
            Issue.record(error)
        }
    } matching: { issue in
        mutex.withLock { $0.append(issue.description) }
        return true
    }
    #endif

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
