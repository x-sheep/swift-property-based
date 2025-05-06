//
//  PropertyCheck.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 03/05/2025.
//

import Gen
import Testing

/// Repeatedly calls the given function with randomized inputs to find a failing case.
///
/// Call this within a Test to generate inputs in a reproducible manner.
///
/// # Examples
///
/// Simple example:
/// ```swift
/// @Test func testDuplication() async {
///   await propertyCheck(input: .int(in: 0...100)) { n in
///     #expect(n + n == n * 2)
///   }
/// }
/// ```
///
/// Example with multiple inputs:
/// ```swift
/// let stringCreator = Gen.letterOrNumber.string(of: .int(in: 1...10))
///
/// @Test func testStringRepeat() async {
///   await propertyCheck(count: 500, input: stringCreator, .int(in: 0...5)) { str, n in
///     let actual = String(repeating: str, count: n)
///     #expect(actual.length == str.length * n)
///   }
/// }
/// ```
///
/// # Using fixed seeds
///
/// It's possible that a test only fails on very specific inputs that don't trigger every time.
/// ```swift
/// @Test func failsSometimes() async {
///   await propertyCheck(input: .int(in: 0...1000)) { n in
///     #expect(n < 990)
///   }
/// }
/// ```
///
/// The function will report which input caused the failing case, and which seed was used:
///
/// ```
/// Failure occured with input 992.
/// Add `.fixedSeed("aKPPWDEafU0CGMDYHef/ETcbYUyjWQvRVP1DTNy6qJk=")` to the Test to reproduce this issue.
/// ```
///
/// You can supply the fixed seed to reproduce the issue every time.
///
/// ```swift
/// @Test(.fixedSeed("aKPPWDEafU0CGMDYHef/ETcbYUyjWQvRVP1DTNy6qJk="))
/// func failsSometimes() async {
///   await propertyCheck(input: .int(in: 0...1000)) { n in
///     #expect(n < 990)
///   }
/// }
/// ```
///
/// - Parameters:
///   - isolation: The actor to which `body` is isolated, if any.
///   - count:
///     The amount of times `body` will be called. This value must be a non-negative number.
///
///     If a fixed seed is set, this value is ignored.
///   - input: One or more generators to invoke. The result of each generator is passed to `body` as an input.
///   - body: The function to invoke repeatedly.
///   - sourceLocation: The source location to which any recorded issues should be attributed.
public func propertyCheck<each Value>(isolation: isolated (any Actor)? = #isolation, count: Int = 100, input: repeat Gen<each Value>, perform body: (repeat each Value) async throws -> Void, sourceLocation: SourceLocation = #_sourceLocation) async {
    
    precondition(Test.Case.current != nil, "This function must be called from within a Test.")
    precondition(count >= 0, "count must be a non-negative number")
    
    guard count > 0 else { return }
    
    let fixedRng = FixedSeedTrait.fixedRandom
    
    if let fixedRng, fixedRng.rng == nil {
        Issue.record("An invalid seed was provided. Remove the fixedSeed Trait from the Test.", sourceLocation: fixedRng.location)
        return
    }
    
    let actualCount = fixedRng != nil ? 1 : count
    
    for _ in 0..<actualCount {
        var rng = fixedRng?.rng ?? Xoshiro()
        var rngCopy = rng
        
        let foundIssues = await countIssues(isolation: isolation) {
            try await body(repeat (each input).run(using: &rng))
        }
        
        if foundIssues > 0 {
            let seed = rngCopy.currentSeed
            
            var paramLabels: [String] = []
            for gen in repeat each input {
                paramLabels.append(String(describingForTest: gen.run(using: &rngCopy)))
            }
            
            let inputLabel = paramLabels.count == 1 ?
            "Failure occured with input \(paramLabels.first!)." :
            "Failure occured with inputs (\(paramLabels.joined(separator: ", ")))."
            
            if fixedRng == nil {
                Issue.record("\(inputLabel)\n\nAdd `.fixedSeed(\"\(seed)\")` to the Test to reproduce this issue.", sourceLocation: sourceLocation)
            } else {
                Issue.record("\(inputLabel)", sourceLocation: sourceLocation)
            }
            return
        }
        
        if foundIssues == 0, let seedLocation = fixedRng?.location {
            Issue.record("A fixed seed was used, but no expectation failure occured. The property was not tested fully.", sourceLocation: seedLocation)
        }
    }
}
