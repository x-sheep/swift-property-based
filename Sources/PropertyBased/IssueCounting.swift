//
//  IssueCounting.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Testing

func countIssues(isolation: isolated (any Actor)? = #isolation, suppress: Bool, perform: () async throws -> Void) async -> Int {
    let found = Mutex(0)
    
    // This is currently the only way to get a callback whenever an issue is found within a block.
    try? await withKnownIssue(isIntermittent: true, isolation: isolation) {
        try await perform()
    } matching: { _ in
        found.withLock { $0 += 1 }
        return suppress
    }
    
    return found.withLock { $0 }
}
