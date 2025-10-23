# PropertyBased

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fx-sheep%2Fswift-property-based%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/x-sheep/swift-property-based)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fx-sheep%2Fswift-property-based%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/x-sheep/swift-property-based)

PropertyBased is a Swift 6 library that enables Property-Based Testing in `swift-testing`, similar to QuickCheck for Haskell or FsCheck for F# and C#.

Property-Based Testing can be used as an alternative for (or in addition to) testing with hardcoded values.

## Features

* Works through Swift Testing, including on platforms without [Foundation](https://developer.apple.com/documentation/foundation) support
* Contains a set of generators for all commonly-used types in the Swift standard library, as well as Dates, `OptionSet` and `CaseIterable` enums
* Compose generators to create more complex inputs
* Automatically [shrink](#shrinking) large inputs to easily digestable inputs, including for custom types without extra effort
* Switch to specific failing cases with just [a single line](#using-fixed-seeds)

## Requirements

* Swift 6.2 (or Xcode 26)
  * Limited support for Swift 6.1 and Xcode 16.3
* Any platform supported by Swift Testing
  * macOS 10.15+
  * iOS/tvOS 13.0+, watchOS 6.0+, visionOS 1.0+
  * Linux, Windows, etc.

## Installation

### When writing a Swift package:

Add the following line to the dependencies array in your `Package.swift` file:
```swift
.package(url: "https://github.com/x-sheep/swift-property-based.git", from: "1.0.0")
```

Then add the following to your test target:
```swift
dependencies: [
  .product(name: "PropertyBased", package: "swift-property-based"),
]
```

### When writing an Xcode project:

1. Open your Project
2. Go to File > Add Package Dependencies...
3. Paste the repository URL in the search field: `https://github.com/x-sheep/swift-property-based.git`

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

After shrinking, the new failing case is `[46, 97, 68, 23, 16]`, which sums to exactly `250`. The first few elements have been removed, while the middle element has been reduced to be closer to the edge. PropertyBased will output both the shrunk input and the original input:

```
Failure occured with input [46, 97, 68, 23, 16].
(shrunk down from [63, 61, 33, 53, 97, 68, 23, 16] after 7 iterations)
```

When using the built-in generators and the `zip` function, shrinkers will also be composed.

The `.shrinking` TestTrait or SuiteTrait can be used to override shrinking behavior.

# License

Copyright (c) 2025 Lennard Sprong.

Includes a modified version of [swift-gen](https://github.com/pointfreeco/swift-gen), which is Copyright (c) 2019 Point-Free, Inc.

[MIT License](./LICENSE)
