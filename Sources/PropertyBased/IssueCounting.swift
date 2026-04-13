//
//  IssueCounting.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Testing

struct CountResult {
    var errors: Int = 0
    var warnings: Int = 0
}

func countIssues(isolation: isolated (any Actor)? = #isolation, suppress: Bool, perform: () async throws -> Void) async
    -> CountResult
{
    let found = Mutex(CountResult())

    #if swift(>=6.2)
    nonisolated(unsafe) let closure = perform

    let handler = IssueHandlingTrait.compactMapIssues { input in
        var issue = input
        if FixedSeedTrait.fixedRandom != nil {
            issue.isWarning = false
        }

        found.withLock {
            if issue.isWarning {
                $0.warnings += 1
            } else {
                $0.errors += 1
            }
        }
        guard !suppress else { return nil }
        return issue
    }

    try? await handler.provideScope(for: Test.current!, testCase: Test.Case.current) {
        try await run(closure, in: isolation)
    }
    #else
    try? await withKnownIssue(isIntermittent: true, isolation: isolation) {
        try await perform()
    } matching: { _ in
        found.withLock { $0.errors += 1 }
        return suppress
    }
    #endif

    return found.withLock { $0 }
}

extension Issue {
    #if swift(>=6.3)
    var isWarning: Bool {
        get { severity == .warning }
        set {
            severity = newValue ? .warning : .error
        }
    }
    #else
    var isWarning: Bool {
        get { false }
        set {}
    }
    #endif
}

@inlinable
func run(_ closure: () async throws -> Void, in isolation: isolated (any Actor)?) async throws {
    try await closure()
}
