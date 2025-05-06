# PropertyBased

PropertyBased is a Swift 6 library that enables Property-Based Testing in `swift-testing`, similar to QuickCheck for Haskell or FsCheck for F# and C#.

Property-Based Testing can be used as an alternative for (or in addition to) testing with hardcoded values. Run tests with random values, and easily switch to specific values when debugging a test failure. 

This library uses [swift-gen by Point-Free](https://github.com/pointfreeco/swift-gen) for reproducible random generation.

## Examples

Simple example:
```swift
import Testing
import PropertyBased

@Test func testDuplication() async {
  await propertyCheck(input: .int(in: 0...100)) { n in
    #expect(n + n == n * 2)
  }
}
```
Example with multiple inputs, and a custom repeat count:
```swift
import Testing
import Gen
import PropertyBased

let stringCreator = Gen.letterOrNumber.string(of: .int(in: 1...10))

@Test func testStringRepeat() async {
  await propertyCheck(count: 500, input: stringCreator, .int(in: 0...5)) { str, n in
    let actual = String(repeating: str, count: n)
    #expect(actual.length == str.length * n)
  }
}
```

## Using fixed seeds

It's possible that a test only fails on very specific inputs that don't trigger every time.

```swift
@Test func failsSometimes() async {
  await propertyCheck(input: .int(in: 0...1000)) { n in
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
  await propertyCheck(input: .int(in: 0...1000)) { n in
    #expect(n < 990)
  }
}
```

# Limitations

This library currently does not include shrinking functionality, which would allow for failing inputs to be reduced to simpler values (e.g. numbers closer to zero, or collections with fewer elements).

1. The version of the Testing library that's bundled with Swift currently doesn't allow third-party plugins to change the behavior of issue reporting. Without changes, every intermediate step in the shrinking process will be reported as a new issue.
2. Adding shrinker functions to `swift-gen` is possibly out of scope for that package. Since valid shrinker values depend on the specifications of the generator, a new fork of that project would be required in the future.

# License

Copyright (c) 2025 Lennard Sprong. [MIT License](./LICENSE)
