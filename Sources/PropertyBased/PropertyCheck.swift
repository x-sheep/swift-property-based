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
/// ### Examples
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
/// ### Using fixed seeds
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
/// ### Shrinking
///
/// > Note: This feature is experimental, and disabled by default. The shrinking output will be very verbose, due to a limitation in Swift Testing.
///
/// When a failing case has been found, it's possible that the input is large and contrived, such as arrays with many elements. When _shrinking_ is enabled, PropertyBased will repeat a failing test until it finds the smallest possible input that still causes a failure.
///
/// For example, the following test fails when the given numbers sum to a value above a certain threshold:
///
/// ```swift
/// @Test func checkSumInRange() async {
///     await propertyCheck(input: Gen.int(in: 0...100).array(of: 1...10)) { numbers in
///         let sum = numbers.reduce(0, +)
///         #expect(sum < 250)
///     }
/// }
/// ```
///
/// The generator could come up with an array like `[63, 61, 33, 53, 97, 68, 23, 16]`, which sums to `414`. Ideally, we want to have an input that sums to exactly `250`.
///
/// Enable the shrinker by adding the `shrinking` trait:
///
/// ```swift
/// @Test(.shrinking) func checkSumInRange() async
/// ```
///
/// After shrinking, the new failing case is `[46, 97, 68, 23, 16]`, which sums to exactly `250`. The first few elements have been removed, while the middle element has been reduced to be closer to the edge.
///
/// When using built-in generators and the `zip` function to combine them, shrinkers will also be composed.
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

        let (inputValue, resultValue) = input.runFull(&rng)

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
                let candidates = input._shrinker(shrunkenInput)

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

            let originalParamLabel = String(describingForTest: resultValue)

            let failureMessage: String

            if shrinkCount == 0 {
                failureMessage = "Failure occured with input \(originalParamLabel)."
            } else {
                let shrunkParamLabel = String(describingForTest: input._mapFilter(shrunkenInput)!)
                failureMessage =
                    "Failure occured with input \(shrunkParamLabel).\n(shrunk down from \(originalParamLabel) after \(shrinkCount) iteration\(shrinkCount != 1 ? "s" : ""))"
            }

            if fixedRng == nil {
                Issue.record(
                    "\(failureMessage)\n\nAdd `.fixedSeed\(seed)` to the Test to reproduce this issue.",
                    sourceLocation: sourceLocation)
            } else {
                Issue.record("\(failureMessage)", sourceLocation: sourceLocation)
            }
            return
        }
    }
}
