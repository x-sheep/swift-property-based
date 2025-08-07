//
//  IssueCounting.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Testing

func countIssues(isolation: isolated (any Actor)? = #isolation, suppress: Bool, perform: () async throws -> Void) async
    -> Int
{
    let found = Mutex(0)

    #if swift(>=6.2)
    nonisolated(unsafe) let closure = perform

    let handler = IssueHandlingTrait.filterIssues { _ in
        found.withLock { $0 += 1 }
        return !suppress
    }

    try? await handler.provideScope(for: Test.current!, testCase: Test.Case.current) {
        try await run(closure, in: isolation)
    }
    #else
    try? await withKnownIssue(isIntermittent: true, isolation: isolation) {
        try await perform()
    } matching: { _ in
        found.withLock { $0 += 1 }
        return suppress
    }
    #endif

    return found.withLock { $0 }
}

@inlinable
func run(_ closure: () async throws -> Void, in isolation: isolated (any Actor)?) async throws {
    try await closure()
}
