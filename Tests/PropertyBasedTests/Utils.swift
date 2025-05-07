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
