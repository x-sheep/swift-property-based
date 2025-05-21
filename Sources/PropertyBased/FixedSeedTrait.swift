//
//  FixedSeedTrait.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

import Testing

/// A trait that overrides the seed used by all property checks within a Test.
///
/// Use ``fixedSeed(_:sourceLocation:)`` to construct an instance of this trait.
public struct FixedSeedTrait: TestTrait, TestScoping {
    init(_ rng: Xoshiro?, _ sourceLocation: SourceLocation) {
        self.rng = rng
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
        
        let foundIssues = await countIssues(suppress: false) {
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
#if canImport(Foundation)
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
        let rng = Xoshiro(seed: seed.description)
        return Self(rng, sourceLocation)
    }
#else
    @available(*, unavailable, message: "Base64-encoded seeds aren't supported on platforms without Foundation.\nUse the fixedSeed() overload that takes UInt64's instead.")
    public static func fixedSeed(_ seed: StaticString, sourceLocation: SourceLocation = #_sourceLocation) -> Self {
        fatalError("Base64 is not supported")
    }
#endif
    
    /// Override the seed used by all property checks within this Test.
    ///
    /// If one of your property checks fails intermittently, apply this trait to reliably reproduce the issue.
    ///
    /// > Important: Do not commit usages of this trait into version control. Applying this trait will always report an issue regardless of the existence of any failures within the test.
    ///
    /// - Parameters:
    ///   - s1: The first part of the seed to use.
    ///   - s2: The second part of the seed.
    ///   - s3: The third part of the seed.
    ///   - s4: The fourth part of the seed.
    ///   - sourceLocation: The source location of the trait.
    ///
    /// - Returns: An instance of ``FixedSeedTrait``.
    public static func fixedSeed(_ s1: UInt64, _ s2: UInt64, _ s3: UInt64, _ s4: UInt64, sourceLocation: SourceLocation = #_sourceLocation) -> Self {
        let rng = Xoshiro(seed: (s1, s2, s3, s4))
        return Self(rng, sourceLocation)
    }
}
