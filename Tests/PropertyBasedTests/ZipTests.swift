// Auto-generated from ZipTests.swift.gyb

import Testing

@testable import PropertyBased

@Suite struct ZipTests {
    @Test func testPropertyCheckOverloads() async {

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool) { a, b in
            let values = [a, b]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool) { a, b, c in
            let values = [a, b, c]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d in
            let values = [a, b, c, d]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e in
            let values = [a, b, c, d, e]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) {
            a, b, c, d, e, f in
            let values = [a, b, c, d, e, f]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) {
            a, b, c, d, e, f, g in
            let values = [a, b, c, d, e, f, g]
            #expect(!values.isEmpty)
        }

        await propertyCheck(
            count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool
        ) { a, b, c, d, e, f, g, h in
            let values = [a, b, c, d, e, f, g, h]
            #expect(!values.isEmpty)
        }

        await propertyCheck(
            count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool
        ) { a, b, c, d, e, f, g, h, i in
            let values = [a, b, c, d, e, f, g, h, i]
            #expect(!values.isEmpty)
        }

        await propertyCheck(
            count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool,
            Gen.bool
        ) { a, b, c, d, e, f, g, h, i, j in
            let values = [a, b, c, d, e, f, g, h, i, j]
            #expect(!values.isEmpty)
        }
    }

    @Test func testZipShrinkOverloads() async {
        var rng = Xoshiro() as any SeededRandomNumberGenerator

        repeat {
            let gen = zip(Gen.bool(1), Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let gen = zip(
                Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)
            var progress = PropertyCheckProgress.one
            let result = gen._runIntermediate(&rng, &progress)
            let shrunk = gen._shrinker(result).makeIterator().next()
            #expect(shrunk != nil)
        } while false
    }
}
