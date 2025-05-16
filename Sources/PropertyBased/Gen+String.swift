//// Adapted from https://github.com/pointfreeco/swift-gen
//// Copyright (c) 2019 Point-Free, Inc. MIT License
//
//extension Gen where Value == UnicodeScalar, ShrinkSequence == Shrink.None<Value> {
//    /// Returns a generator of random unicode scalars within the specified range.
//    ///
//    /// - Parameter range: The range in which to create a random unicode scalar. `range` must be finite.
//    /// - Returns: A generator of random unicode scalars within the bounds of range.
//    @inlinable
//    public static func unicodeScalar(in range: ClosedRange<Value>) -> Gen {
//        return Gen<UInt32>
//            .int(in: range.lowerBound.value...range.upperBound.value)
//            .map { UnicodeScalar($0)! }
//    }
//}
//
//extension Gen where Value == Character, ShrinkSequence == Shrink.None<Value> {
//    // FIXME: Make safe for characters with multiple scalars.
//    /// Returns a generator of random characters within the specified range.
//    ///
//    /// - Parameter range: The range in which to create a random character. `range` must be finite.
//    /// - Returns: A generator of random characters within the bounds of range.
//    @inlinable
//    public static func character(in range: ClosedRange<Value>) -> Gen {
//        return Gen<UnicodeScalar>
//            .unicodeScalar(
//                in: range.lowerBound.unicodeScalars.first!...range.upperBound.unicodeScalars.last!
//            )
//            .map(Character.init)
//    }
//    
//    /// A generator of random numeric digits.
//    public static let number = Gen.character(in: "0"..."9")
//    
//    /// A generator of uppercase letters.
//    public static let uppercaseLetter = Gen.character(in: "A"..."Z")
//    
//    /// A generator of lowercase letters.
//    public static let lowercaseLetter = Gen.character(in: "a"..."z")
//    
//    /// A generator of uppercase and lowercase letters.
//    public static let letter = Gen<Character?>
//        .element(of: Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") as [Character])
//        .map { $0! }
//    
//    /// A generator of letters and numbers.
//    public static let letterOrNumber = Gen<Character?>
//        .element(
//            of: Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") as [Character]
//        )
//        .map { $0! }
//    
//    /// A generator of ASCII characters.
//    public static let ascii = Gen<UInt32>.int(in: 0...127)
//        .map { UnicodeScalar($0)! }
//    
//    /// A generator of Latin-1 characters.
//    public static let latin1 = Gen<UInt32>.int(in: 0...255)
//        .map { UnicodeScalar($0)! }
//    
//    /// Produces a new generator of strings of this generator's characters.
//    ///
//    /// - Parameter count: The size of the random string.
//    /// - Returns: A generator of strings.
//    @inlinable
//    public func string(of count: Gen<Int>) -> Gen<String> {
//        return self.map(String.init).array(of: count).map { $0.joined() }
//    }
//}
