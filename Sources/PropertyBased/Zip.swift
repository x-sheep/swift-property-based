// Auto-generated from Zip.swift.gyb

// Yes, I very much would like to use Swift's parameter packing here,
// but there is currently a compiler crash when trying to evaluate the `Gen` type,
// which needs to read from the Value type pack twice. There is also no way to work around it
// by only packing the Sequence type, since same-type constraints are not currently supported by Swift.
//
// These functions will all be removed as soon as it can be fully expressed using a parameter pack.

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
/// - Returns: A generator of tuples.
@inlinable
public func zip<A, B>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
) -> Gen<
    (A, B),
    Shrink.TupleShrinkSequence<(A, B)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let values = (
            v0, v1
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
) -> Gen<
    (A, B, C),
    Shrink.TupleShrinkSequence<(A, B, C)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let values = (
            v0, v1, v2
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
) -> Gen<
    (A, B, C, D),
    Shrink.TupleShrinkSequence<(A, B, C, D)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let values = (
            v0, v1, v2, v3
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
) -> Gen<
    (A, B, C, D, E),
    Shrink.TupleShrinkSequence<(A, B, C, D, E)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let values = (
            v0, v1, v2, v3, v4
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
) -> Gen<
    (A, B, C, D, E, F),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
) -> Gen<
    (A, B, C, D, E, F, G),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
///   - p20: A generator of `U`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
    _ p20: Gen<U, some Sequence<U>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let (v20, s20) = p20._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
///   - p20: A generator of `U`s.
///   - p21: A generator of `V`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
    _ p20: Gen<U, some Sequence<U>>, 
    _ p21: Gen<V, some Sequence<V>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let (v20, s20) = p20._run(&rng)
        let (v21, s21) = p21._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
///   - p20: A generator of `U`s.
///   - p21: A generator of `V`s.
///   - p22: A generator of `W`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
    _ p20: Gen<U, some Sequence<U>>, 
    _ p21: Gen<V, some Sequence<V>>, 
    _ p22: Gen<W, some Sequence<W>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let (v20, s20) = p20._run(&rng)
        let (v21, s21) = p21._run(&rng)
        let (v22, s22) = p22._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
///   - p20: A generator of `U`s.
///   - p21: A generator of `V`s.
///   - p22: A generator of `W`s.
///   - p23: A generator of `X`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
    _ p20: Gen<U, some Sequence<U>>, 
    _ p21: Gen<V, some Sequence<V>>, 
    _ p22: Gen<W, some Sequence<W>>, 
    _ p23: Gen<X, some Sequence<X>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let (v20, s20) = p20._run(&rng)
        let (v21, s21) = p21._run(&rng)
        let (v22, s22) = p22._run(&rng)
        let (v23, s23) = p23._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
///   - p20: A generator of `U`s.
///   - p21: A generator of `V`s.
///   - p22: A generator of `W`s.
///   - p23: A generator of `X`s.
///   - p24: A generator of `Y`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
    _ p20: Gen<U, some Sequence<U>>, 
    _ p21: Gen<V, some Sequence<V>>, 
    _ p22: Gen<W, some Sequence<W>>, 
    _ p23: Gen<X, some Sequence<X>>, 
    _ p24: Gen<Y, some Sequence<Y>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let (v20, s20) = p20._run(&rng)
        let (v21, s21) = p21._run(&rng)
        let (v22, s22) = p22._run(&rng)
        let (v23, s23) = p23._run(&rng)
        let (v24, s24) = p24._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24))
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `A`s.
///   - p1: A generator of `B`s.
///   - p2: A generator of `C`s.
///   - p3: A generator of `D`s.
///   - p4: A generator of `E`s.
///   - p5: A generator of `F`s.
///   - p6: A generator of `G`s.
///   - p7: A generator of `H`s.
///   - p8: A generator of `I`s.
///   - p9: A generator of `J`s.
///   - p10: A generator of `K`s.
///   - p11: A generator of `L`s.
///   - p12: A generator of `M`s.
///   - p13: A generator of `N`s.
///   - p14: A generator of `O`s.
///   - p15: A generator of `P`s.
///   - p16: A generator of `Q`s.
///   - p17: A generator of `R`s.
///   - p18: A generator of `S`s.
///   - p19: A generator of `T`s.
///   - p20: A generator of `U`s.
///   - p21: A generator of `V`s.
///   - p22: A generator of `W`s.
///   - p23: A generator of `X`s.
///   - p24: A generator of `Y`s.
///   - p25: A generator of `Z`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z>(
    _ p0: Gen<A, some Sequence<A>>, 
    _ p1: Gen<B, some Sequence<B>>, 
    _ p2: Gen<C, some Sequence<C>>, 
    _ p3: Gen<D, some Sequence<D>>, 
    _ p4: Gen<E, some Sequence<E>>, 
    _ p5: Gen<F, some Sequence<F>>, 
    _ p6: Gen<G, some Sequence<G>>, 
    _ p7: Gen<H, some Sequence<H>>, 
    _ p8: Gen<I, some Sequence<I>>, 
    _ p9: Gen<J, some Sequence<J>>, 
    _ p10: Gen<K, some Sequence<K>>, 
    _ p11: Gen<L, some Sequence<L>>, 
    _ p12: Gen<M, some Sequence<M>>, 
    _ p13: Gen<N, some Sequence<N>>, 
    _ p14: Gen<O, some Sequence<O>>, 
    _ p15: Gen<P, some Sequence<P>>, 
    _ p16: Gen<Q, some Sequence<Q>>, 
    _ p17: Gen<R, some Sequence<R>>, 
    _ p18: Gen<S, some Sequence<S>>, 
    _ p19: Gen<T, some Sequence<T>>, 
    _ p20: Gen<U, some Sequence<U>>, 
    _ p21: Gen<V, some Sequence<V>>, 
    _ p22: Gen<W, some Sequence<W>>, 
    _ p23: Gen<X, some Sequence<X>>, 
    _ p24: Gen<Y, some Sequence<Y>>, 
    _ p25: Gen<Z, some Sequence<Z>>, 
) -> Gen<
    (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z),
    Shrink.TupleShrinkSequence<(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z)>
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let (v3, s3) = p3._run(&rng)
        let (v4, s4) = p4._run(&rng)
        let (v5, s5) = p5._run(&rng)
        let (v6, s6) = p6._run(&rng)
        let (v7, s7) = p7._run(&rng)
        let (v8, s8) = p8._run(&rng)
        let (v9, s9) = p9._run(&rng)
        let (v10, s10) = p10._run(&rng)
        let (v11, s11) = p11._run(&rng)
        let (v12, s12) = p12._run(&rng)
        let (v13, s13) = p13._run(&rng)
        let (v14, s14) = p14._run(&rng)
        let (v15, s15) = p15._run(&rng)
        let (v16, s16) = p16._run(&rng)
        let (v17, s17) = p17._run(&rng)
        let (v18, s18) = p18._run(&rng)
        let (v19, s19) = p19._run(&rng)
        let (v20, s20) = p20._run(&rng)
        let (v21, s21) = p21._run(&rng)
        let (v22, s22) = p22._run(&rng)
        let (v23, s23) = p23._run(&rng)
        let (v24, s24) = p24._run(&rng)
        let (v25, s25) = p25._run(&rng)
        let values = (
            v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25))
    })
}

