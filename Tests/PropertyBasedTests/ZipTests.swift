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

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f in
            let values = [a, b, c, d, e, f]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g in
            let values = [a, b, c, d, e, f, g]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h in
            let values = [a, b, c, d, e, f, g, h]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i in
            let values = [a, b, c, d, e, f, g, h, i]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j in
            let values = [a, b, c, d, e, f, g, h, i, j]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k in
            let values = [a, b, c, d, e, f, g, h, i, j, k]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y]
            #expect(!values.isEmpty)
        }

        await propertyCheck(count: 5, input: Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool) { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z in
            let values = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z]
            #expect(!values.isEmpty)
        }
    }

    @Test func testZipShrinkOverloads() async {
        var rng = Xoshiro() as any SeededRandomNumberGenerator

        repeat {
            let result = zip(Gen.bool(1), Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
        repeat {
            let result = zip(Gen.bool(1), Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool, Gen.bool)._runIntermediate(&rng)
            let shrunk = result.shrink(result.value).makeIterator().next()
            #expect(shrunk != nil)
        } while false
    }
}
