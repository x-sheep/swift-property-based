//
//  FixedSeedTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Gen
import Testing

/// A trait that overrides the seed used by all property checks within a Test.
///
/// Use ``fixedSeed(_:sourceLocation:)`` to construct an instance of this trait.
public struct FixedSeedTrait: TestTrait, TestScoping {
    init(_ seed: String, _ sourceLocation: SourceLocation) {
        rng = Xoshiro(seed: seed)
        self.sourceLocation = sourceLocation
    }
    
    let rng: Xoshiro?
    let sourceLocation: SourceLocation
    
    @TaskLocal
    static var fixedRandom: (rng: Xoshiro, location: SourceLocation)?
    
    public func provideScope(for test: Test, testCase: Test.Case?, performing function: () async throws -> Void) async {
        if let existing = Self.fixedRandom {
            Issue.record("Two different fixed seeds are used in the same test.", sourceLocation: existing.location)
            return
        }
        
        guard let rng else {
            Issue.record("An invalid seed was provided. Remove the fixedSeed Trait from the Test.", sourceLocation: sourceLocation)
            return
        }
        
        let foundIssues = await countIssues {
            try await Self.$fixedRandom.withValue((rng, location: sourceLocation)) {
                try await function()
            }
        }
        
        if foundIssues == 0 {
            Issue.record("A fixed seed was used, but no expectation failure occured. The property was not tested fully.", sourceLocation: sourceLocation)
        }
    }
}

extension Trait where Self == FixedSeedTrait {
    /// Override the seed used by all property checks within this Test.
    ///
    /// If one of your property checks fails intermittently, apply this trait to reliably reproduce the issue.
    ///
    /// > Important: Do not commit usages of this trait into version control. Applying this trait will always report an issue regardless of the existence of any failures within the test.
    ///
    /// - Parameters:
    ///   - seed: The seed to use.
    ///   - sourceLocation: The source location of the trait.
    ///
    /// - Returns: An instance of ``FixedSeedTrait``.
    public static func fixedSeed(_ seed: StaticString, sourceLocation: SourceLocation = #_sourceLocation) -> Self {
        return Self(seed.description, sourceLocation)
    }
}
