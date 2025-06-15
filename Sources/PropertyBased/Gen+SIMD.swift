//
//  Gen+SIMD.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 19/05/2025.
//

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

extension Generator where ResultValue: SIMDScalar {
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

#if canImport(simd)
import simd
extension Gen where Value == simd_float2 {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<simd_float2, Shrink.None<(Float, Float)>> {
        let gen = Gen<Float>.float(in: 0...1)
        return gen.simd2.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen where Value == simd_float3 {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<simd_float3, Shrink.None<(Float, Float, Float)>> {
        let gen = Gen<Float>.float(in: 0...1)
        return gen.simd3.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen where Value == simd_float4 {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<simd_float4, Shrink.None<(Float, Float, Float, Float)>> {
        let gen = Gen<Float>.float(in: 0...1)
        return gen.simd4.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen where Value == simd_double2 {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<simd_double2, Shrink.None<(Double, Double)>> {
        let gen = Gen<Double>.double(in: 0...1)
        return gen.simd2.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen where Value == simd_double3 {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<simd_double3, Shrink.None<(Double, Double, Double)>> {
        let gen = Gen<Double>.double(in: 0...1)
        return gen.simd3.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

extension Gen where Value == simd_double4 {
    /// A generator of vectors with length 1.
    public static var unitVector: Generator<simd_double4, Shrink.None<(Double, Double, Double, Double)>> {
        let gen = Gen<Double>.double(in: 0...1)
        return gen.simd4.map { normalize($0) }.filter { $0.x.isFinite }.withoutShrink()
    }
}

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
#endif
