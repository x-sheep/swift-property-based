//
//  Challenges.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/04/2026.
//

import PropertyBased
import Testing

extension Array where Element: FixedWidthInteger {
    func uncheckedSum() -> Element {
        reduce(0) { $0 &+ $1 }
    }
}

@Suite struct Challenges {
    @Test func bound5() async {
        let gen = Gen.int16().array(of: 0...10)
        let lists = gen.filter { $0.uncheckedSum() < 256 }.array(of: 5)

        await propertyCheck(input: lists) { input in
            let totalSum = input.map { $0.uncheckedSum() }.uncheckedSum()

            #expect(totalSum < 5 * 256)
        }
    }
    
    @Test func largeUnionList() async {
        let gen = Gen.int().array(of: 0...10).array(of: 0...10)
        
        await propertyCheck(input: gen) { input in
            let distinct = Set(input.flatMap { $0 })

            #expect(distinct.count <= 4)
        }
    }
    
    @Test func reverse() async {
        let gen = Gen.int().array(of: 0...10)
        
        await propertyCheck(input: gen) { input in
            #expect(input.reversed() == input)
        }
    }
    
    indirect enum CalculatorLeaf {
        case constant(Int)
        case addition(CalculatorLeaf, CalculatorLeaf)
        case division(CalculatorLeaf, CalculatorLeaf)
        
        func isSafeDivison() -> Bool {
            return switch self {
            case .division(_, .constant(0)):
                false
            case .addition(let leaf1, let leaf2),
            .division(let leaf1, let leaf2):
                leaf1.isSafeDivison() && leaf2.isSafeDivison()
            case .constant(_):
                true
            }
        }
        
        func evaluate() throws -> Int {
            switch self {
            case .constant(let i): return i
            case .addition(let leaf1, let leaf2):
                return try leaf1.evaluate() + leaf2.evaluate()
            case .division(let leaf1, let leaf2):
                let divisor = try leaf2.evaluate()
                if divisor == 0 {
                    throw CalculatorError.divByZero
                }
                return try leaf1.evaluate() / divisor
            }
        }
    }
    enum CalculatorError: Error {
        case divByZero
    }
    
    // TODO: recursive generators are not supported, so Calculator can't work

    @Test func lengthList() async {
        let gen = Gen.int(in: 0...1000).array(of: 1...100)
        
        await propertyCheck(input: gen) { input in
            #expect(input.max()! < 900)
        }
    }
    
    @Test func differenceMustNotBeZero() async {
        let gen = Gen.int(in: 1...20)
        
        await propertyCheck(input: gen, gen) { a, b in
            #expect(a < 10 || a != b)
        }
    }
    
    @Test func differenceMustNotBeSmall() async {
        let gen = Gen.int(in: 1...20)
        
        await propertyCheck(input: gen, gen) { a, b in
            #expect(a < 10 || a == b || abs(a - b) > 4)
        }
    }
    
    @Test func differenceMustNotBeOne() async {
        let gen = Gen.int(in: 1...20)
        
        await propertyCheck(input: gen, gen) { a, b in
            #expect(a < 10 || abs(a - b) != 1)
        }
    }
    
    @Test func distinct() async {
        let gen = Gen.int().array(of: 0...10)
        
        await propertyCheck(input: gen) { input in
            let distinct = Set(input)
            #expect(distinct.count < 3)
        }
    }
    
    @Test func nestedLists() async {
        let gen = Gen.always(0).array(of: 0...100).array(of: 0...100)
        
        await propertyCheck(input: gen) { input in
            let total = input.reduce(0) { $0 + $1.count }
            #expect(total <= 10)
        }
    }
}
