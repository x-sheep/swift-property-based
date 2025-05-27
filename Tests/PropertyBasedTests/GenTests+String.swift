//
//  GenTests+String.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 26/05/2025.
//

import Testing
import PropertyBased

@Suite struct GenStringTests {
    @Test func testGenerateLowercaseString() async {
        let gen = Gen.lowercaseLetter.string(of: 1...10)
        
        await testGen(gen)
        
        await propertyCheck(input: gen) { str in
            #expect(str.allSatisfy { $0.isLowercase })
        }
    }
    
    @Test func testGenerateCharacters() async {
        await testGen(Gen.letter.string(of: 1...10))
        await testGen(Gen.letterOrNumber.string(of: 5))
        await testGen(Gen.ascii.string(of: 10))
        await testGen(Gen.latin1.string(of: 5...10))
    }
}
