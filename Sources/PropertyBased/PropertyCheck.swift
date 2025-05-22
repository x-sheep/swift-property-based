//
//  PropertyCheck.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 03/05/2025.
//

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
///   await propertyCheck(input: Gen.int(in: 0...100)) { n in
///     #expect(n + n == n * 2)
///   }
/// }
/// ```
///
/// Example with multiple inputs:
/// ```swift
/// let stringCreator = Gen.letterOrNumber.string(of: Gen.int(in: 1...10))
///
/// @Test func testStringRepeat() async {
///   await propertyCheck(count: 500, input: stringCreator, Gen.int(in: 0...5)) { str, n in
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
///   await propertyCheck(input: Gen.int(in: 0...1000)) { n in
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
///   await propertyCheck(input: Gen.int(in: 0...1000)) { n in
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
public func propertyCheck<InputValue, ResultValue>(
    count: Int = 100,
    input: Generator<ResultValue, some Sequence<InputValue>>,
    perform body: (ResultValue) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    
    precondition(Test.Case.current != nil, "This function must be called from within a Test.")
    precondition(count >= 0, "count must be a non-negative number")
    
    guard count > 0 else { return }
    
    let fixedRng = FixedSeedTrait.fixedRandom
    
    let actualCount = fixedRng != nil ? 1 : count
    
    for _ in 0..<actualCount {
        var rng = fixedRng?.rng ?? Xoshiro()
        let rngCopy = rng
        
        let ((inputValue, shrink), resultValue) = input.runFull(&rng)
        
        let foundIssues = await countIssues(isolation: isolation, suppress: EnableShrinkTrait.isEnabled) {
            try await body(resultValue)
        }
        
        if foundIssues > 0 {
            let seed = rngCopy.traitHint
            
            var shrunkenInput = inputValue
            
            var didShrink = EnableShrinkTrait.isEnabled
            var shrinkCount = 0
            while didShrink {
                didShrink = false
                let candidates = shrink(shrunkenInput)
                
                for c in candidates {
                    guard let mappedShrunk = input._mapFilter(c) else { continue }
                    
                    let shrunkIssues = await countIssues(isolation: isolation, suppress: true) {
                        try await body(mappedShrunk)
                    }
                    
                    if shrunkIssues > 0 {
                        didShrink = true
                        shrinkCount += 1
                        shrunkenInput = c
                        break
                    }
                }
            }
            
            // If previous inputs were suppressed, run the block one more time to fully record all issues.
            if EnableShrinkTrait.isEnabled {
                _ = await countIssues(isolation: isolation, suppress: false) {
                    try await body(input._mapFilter(shrunkenInput)!)
                }
            }
            
            let shrunkParamLabel = String(describingForTest: shrunkenInput)
            
            let failureMessage: String
            
            if shrinkCount == 0 {
                failureMessage = "Failure occured with input \(shrunkParamLabel)."
            } else {
                let originalParamLabel = String(describingForTest: inputValue)
                failureMessage = "Failure occured with input \(shrunkParamLabel).\n(shrunk down from \(originalParamLabel) after \(shrinkCount) iteration\(shrinkCount != 1 ? "s" : ""))"
            }
            
            if fixedRng == nil {
                Issue.record("\(failureMessage)\n\nAdd `.fixedSeed\(seed)` to the Test to reproduce this issue.", sourceLocation: sourceLocation)
            } else {
                Issue.record("\(failureMessage)", sourceLocation: sourceLocation)
            }
            return
        }
    }
}
