//
//  Gen+SIMD.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 19/05/2025.
//

#if canImport(simd)
import simd
#endif

extension Generator {
    /// Produces a generator that creates a pair of values.
    ///
    /// This is equivalent to calling `zip(self, self)`.
    ///
    /// ### Example
    /// ```swift
    /// Gen.cgFloat(in: 0 ..< 800).pair.map { CGPoint(x: $0, y: $1) }
    /// ```
    public var pair: Generator<(ResultValue, ResultValue), Shrink.Tuple<(InputValue, InputValue)>> {
        return zip(self, self)
    }
}

extension Generator where ResultValue: SIMDScalar & Sendable {
    /// Produces a generator that creates a SIMD vector of values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.float(in: 0 ... 1).simd2
    /// ```
    public var simd2: Generator<SIMD2<ResultValue>, Shrink.Tuple<(InputValue, InputValue)>> {
        return pair.map { SIMD2($0, $1) }
    }

    /// Produces a generator that creates a SIMD vector of values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.float(in: 0 ... 1).simd3
    /// ```
    public var simd3: Generator<SIMD3<ResultValue>, Shrink.Tuple<(InputValue, InputValue, InputValue)>> {
        return zip(self, self, self).map { t in SIMD3(t.0, t.1, t.2) }
    }

    /// Produces a generator that creates a SIMD vector of values.
    ///
    /// ### Example
    /// ```swift
    /// Gen.float(in: 0 ... 1).simd4
    /// ```
    public var simd4: Generator<SIMD4<ResultValue>, Shrink.Tuple<(InputValue, InputValue, InputValue, InputValue)>> {
        return zip(self, self, self, self).map { t in SIMD4(t.0, t.1, t.2, t.3) }
    }
}

extension Gen<SIMD2<Float>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD2<Float>, Shrink.None<(Float, Float)>> {
        let gen = Gen<Float>.float(in: 0...1)
        return gen.simd2.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen<SIMD3<Float>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD3<Float>, Shrink.None<(Float, Float, Float)>> {
        let gen = Gen<Float>.float(in: 0...1)
        return gen.simd3.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen<SIMD4<Float>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD4<Float>, Shrink.None<(Float, Float, Float, Float)>> {
        let gen = Gen<Float>.float(in: 0...1)
        return gen.simd4.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen<SIMD2<Double>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD2<Double>, Shrink.None<(Double, Double)>> {
        let gen = Gen<Double>.double(in: 0...1)
        return gen.simd2.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen<SIMD3<Double>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD3<Double>, Shrink.None<(Double, Double, Double)>> {
        let gen = Gen<Double>.double(in: 0...1)
        return gen.simd3.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen<SIMD4<Double>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD4<Double>, Shrink.None<(Double, Double, Double, Double)>> {
        let gen = Gen<Double>.double(in: 0...1)
        return gen.simd4.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

#if !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Gen<SIMD2<Float16>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD2<Float16>, Shrink.None<(Float16, Float16)>> {
        let gen = Gen<Float16>.float16(in: 0...1)
        return gen.simd2.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Gen<SIMD3<Float16>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD3<Float16>, Shrink.None<(Float16, Float16, Float16)>> {
        let gen = Gen<Float16>.float16(in: 0...1)
        return gen.simd3.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Gen<SIMD4<Float16>> {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<SIMD4<Float16>, Shrink.None<(Float16, Float16, Float16, Float16)>> {
        let gen = Gen<Float16>.float16(in: 0...1)
        return gen.simd4.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}
#endif

#if canImport(simd)
extension Gen where Value == simd_quatf {
    /// A generator of rotation quaternions with length 1 and a random angle.
    public static var simd_quatf: Generator<simd_quatf, Shrink.Tuple<(Float, (Float, Float, Float))>> {
        let angle = Gen<Float>.float(in: 0 ..< .pi * 2).withoutShrink()
        let vector = Gen<simd_float3>.unitVector
        return zip(angle, vector).map { t in simd.simd_quatf(angle: t.0, axis: t.1) }
    }
}

extension Gen where Value == simd_quatd {
    /// A generator of rotation quaternions with length 1 and a random angle.
    public static var simd_quatd: Generator<simd_quatd, Shrink.Tuple<(Double, (Double, Double, Double))>> {
        let angle = Gen<Double>.double(in: 0 ..< .pi * 2).withoutShrink()
        let vector = Gen<simd_double3>.unitVector
        return zip(angle, vector).map { t in simd.simd_quatd(angle: t.0, axis: t.1) }
    }
}

#if !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Gen where Value == simd_quath {
    /// A generator of rotation quaternions with length 1 and a random angle.
    public static var simd_quath: Generator<simd_quath, Shrink.Tuple<(Float, (Float, Float, Float))>> {
        return Gen<simd_quatf>.simd_quatf.map { q in
            simd.simd_quath(vector: simd_half4(q.vector))
        }
    }
}
#endif

#endif

@_disfavoredOverload
func length<F: FloatingPoint, T: SIMD<F>>(_ item: T) -> F {
    (item * item).sum().squareRoot()
}
@_disfavoredOverload
func normalize<F: FloatingPoint, T: SIMD<F>>(_ item: T) -> T {
    return item / length(item)
}
