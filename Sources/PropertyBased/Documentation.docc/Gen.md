# ``PropertyBased/Gen``

This namespace can be extended with custom generators, while hiding certain implementation details from call sites.

For example, a new generator for a `Int256` type could be added like this:

```swift
extension Gen where Value == Int256 {
    static func int256() -> Generator<Int256, Shrink.Integer<Int256>> {
        Gen<Int256>.value()
    }
}
```

This new generator can now be used by writing the following: 
```swift
Gen.int256()
```

See ``Generator`` for transforming generators into collections and other values.

## Topics

### Generating numbers

- ``/Gen/int(in:)``
- ``/Gen/float(in:)``
- ``/Gen/double(in:)``
- ``/Gen/bool``

### Generating strings

You can generate individual characters, and use ``/Generator/string(of:)`` to form strings.

- ``/Gen/letter``
- ``/Gen/lowercaseLetter``
- ``/Gen/uppercaseLetter``
- ``/Gen/number``
- ``/Gen/letterOrNumber``
- ``/Gen/latin1``
- ``/Gen/ascii``
- ``/Gen/character(in:)``
- ``/Gen/unicodeScalar(in:)``

### Handling immutable collections

- ``/Gen/case``
- ``/Gen/element(of:)``
- ``/Gen/shuffled(_:)``

### Generating specific number types

- ``/Gen/int8(in:)``
- ``/Gen/int16(in:)``
- ``/Gen/int32(in:)``
- ``/Gen/int64(in:)``
- ``/Gen/int128(in:)``
- ``/Gen/uint(in:)``
- ``/Gen/uint8(in:)``
- ``/Gen/uint16(in:)``
- ``/Gen/uint32(in:)``
- ``/Gen/uint64(in:)``
- ``/Gen/uint128(in:)``
- ``/Gen/cgFloat(in:)``
- ``/Gen/float16(in:)``

## See Also

- ``PropertyBased/Generator``
