//
//  Utils.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 06/05/2025.
//

import Testing
@testable import PropertyBased

func gatherIssues(block: @Sendable () async -> Void) async -> [Issue] {
    let mutex = Mutex([] as [Issue])

    // No way to stop issues from still being recorded. Ignore those for now.
    await withKnownIssue {
        await block()
    } matching: { issue in
        mutex.withLock { $0.append(issue) }
        return true
    }
    
    return mutex.withLock { $0 }
}
