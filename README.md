# PropertyBased

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fx-sheep%2Fswift-property-based%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/x-sheep/swift-property-based)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fx-sheep%2Fswift-property-based%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/x-sheep/swift-property-based)

PropertyBased is a Swift 6 library that enables Property-Based Testing in `swift-testing`, similar to QuickCheck for Haskell or FsCheck for F# and C#.

Property-Based Testing can be used as an alternative for (or in addition to) testing with hardcoded values. Run tests with random values, and easily switch to specific values when debugging a test failure. 

This project aims to support all platforms which can run Swift Testing, including platforms without [Foundation](https://developer.apple.com/documentation/foundation) support.

## Requirements

* Swift 6.1 (or Xcode 16.3)
* Any platform supported by Swift Testing
  * macOS 10.15+
  * iOS/tvOS 13.0+, watchOS 6.0+, visionOS 1.0+
  * Linux, Windows, etc.

## Examples

Simple example:
```swift
import Testing
import PropertyBased

@Test func testDuplication() async {
  await propertyCheck(input: Gen.int(in: 0...100)) { n in
    #expect(n + n == n * 2)
  }
}
```
Example with multiple inputs, and a custom repeat count:
```swift
import Testing
import PropertyBased

let stringCreator: Generator<String, some Sequence> = Gen.letterOrNumber.string(of: 1...10)

@Test func testStringRepeat() async {
  await propertyCheck(count: 500, input: stringCreator, Gen.int(in: 0...5)) { str, n in
    let actual = String(repeating: str, count: n)
    #expect(actual.length == str.length * n)
  }
}
```

## Using fixed seeds

It's possible that a test only fails on very specific inputs that don't trigger every time.

```swift
@Test func failsSometimes() async {
  await propertyCheck(input: Gen.int(in: 0...1000)) { n in
    #expect(n < 990)
  }
}
```

PropertyBased will report which input caused the failing case, and which seed was used:

```
Failure occured with input 992.
Add `.fixedSeed("aKPPWDEafU0CGMDYHef/ETcbYUyjWQvRVP1DTNy6qJk=")` to the Test to reproduce this issue.
```

You can supply the fixed seed to reproduce the issue every time.

```swift
@Test(.fixedSeed("aKPPWDEafU0CGMDYHef/ETcbYUyjWQvRVP1DTNy6qJk="))
func failsSometimes() async {
  await propertyCheck(input: Gen.int(in: 0...1000)) { n in
    #expect(n < 990)
  }
}
```

# Shrinking

> [!NOTE] 
> This feature is experimental, and disabled by default. The shrinking output will be very verbose, due to a limitation in Swift Testing.

When a failing case has been found, it's possible that the input is large and contrived, such as arrays with many elements. When _shrinking_ is enabled, PropertyBased will repeat a failing test until it finds the smallest possible input that still causes a failure.

For example, the following test fails when the given numbers sum to a value above a certain threshold:

```swift
@Test func checkSumInRange() async {
    await propertyCheck(input: Gen.int(in: 0...100).array(of: 1...10)) { numbers in
        let sum = numbers.reduce(0, +)
        #expect(sum < 250)
    }
}
```

The generator could come up with an array like `[63, 61, 33, 53, 97, 68, 23, 16]`, which sums to `414`. Ideally, we want to have an input that sums to exactly `250`.

Enable the shrinker by adding the `shrinking` trait:

```swift
@Test(.shrinking) func checkSumInRange() async
```

After shrinking, the new failing case is `[46, 97, 68, 23, 16]`, which sums to exactly `250`. The first few elements have been removed, while the middle element has been reduced to be closer to the edge.

When using the built-in generators and the `zip` function, shrinkers will also be composed.

# License

Copyright (c) 2025 Lennard Sprong.

Includes a modified version of [swift-gen](https://github.com/pointfreeco/swift-gen), which is Copyright (c) 2019 Point-Free, Inc.

[MIT License](./LICENSE)
