//// Adapted from https://github.com/pointfreeco/swift-gen
//// Copyright (c) 2019 Point-Free, Inc. MIT License

extension Gen where Value == UnicodeScalar {
    /// Returns a generator of random unicode scalars within the specified range.
    ///
    /// - Parameter range: The range in which to create a random unicode scalar. `range` must be finite.
    /// - Returns: A generator of random unicode scalars within the bounds of range.
    @inlinable
    public static func unicodeScalar(in range: ClosedRange<Value>) -> Generator<UnicodeScalar, Shrink.None<UInt32>> {
        return Gen<UInt32>
            .value(in: range.lowerBound.value...range.upperBound.value)
            .withoutShrink()
            .map { UnicodeScalar($0)! }
    }
}

extension Gen where Value == Character {
    // FIXME: Make safe for characters with multiple scalars.
    /// Returns a generator of random characters within the specified range.
    ///
    /// - Parameter range: The range in which to create a random character. `range` must be finite.
    /// - Returns: A generator of random characters within the bounds of range.
    @inlinable
    public static func character(in range: ClosedRange<Value>) -> Generator<Character, Shrink.None<UInt32>> {
        return Gen<UnicodeScalar>
            .unicodeScalar(
                in: range.lowerBound.unicodeScalars.first!...range.upperBound.unicodeScalars.last!
            )
            .map(Character.init)
    }
    
    /// A generator of random numeric digits.
    public static let number = Gen.character(in: "0"..."9")
    
    /// A generator of uppercase letters.
    public static let uppercaseLetter = Gen.character(in: "A"..."Z")
    
    /// A generator of lowercase letters.
    public static let lowercaseLetter = Gen.character(in: "a"..."z")
    
    /// A generator of uppercase and lowercase letters.
    public static let letter = Gen<Character?>
        .element(of: Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") as [Character])
        .map { $0! }
    
    /// A generator of letters and numbers.
    public static let letterOrNumber = Gen<Character?>
        .element(
            of: Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") as [Character]
        )
        .map { $0! }
    
    /// A generator of ASCII characters.
    public static let ascii = Gen<UInt8>.value(in: 0...127)
        .map { Character(UnicodeScalar($0)) }
    
    /// A generator of Latin-1 characters.
    public static let latin1 = Gen<UInt8>.value(in: 0...255)
        .map { Character(UnicodeScalar($0)) }
}

extension Generator where ResultValue == Character {
    /// Produces a new generator of strings of this generator's characters.
    ///
    /// - Parameter count: The size of the random string.
    /// - Returns: A generator of strings.
    @inlinable
    public func string(of count: ClosedRange<Int>) -> Generator<String, some Sequence<[InputValue]>> {
        return self.array(of: count).map { String($0) }
    }
    
    /// Produces a new generator of strings of this generator's characters.
    ///
    /// - Parameter count: The size of the random string.
    /// - Returns: A generator of strings.
    @inlinable
    public func string(of count: Int) -> Generator<String, some Sequence<[InputValue]>> {
        return self.array(of: count).map { String($0) }
    }
}
