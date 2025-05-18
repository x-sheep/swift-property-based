// Auto-generated from PropertyCheck+Pack.swift.gyb

// Yes, I very much would like to use Swift's parameter packing here,
// but there is currently a compiler crash when trying to evaluate the `Gen` type,
// which needs to read from the Value type pack twice. There is also no way to work around it
// by only packing the Sequence type, since same-type constraints are not currently supported by Swift.
//
// These functions will all be removed as soon as it can be fully expressed using a parameter pack.

import Testing

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    perform body: (A, B) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1), 
        perform: {
            try await body($0.0, $0.1)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    perform body: (A, B, C) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2), 
        perform: {
            try await body($0.0, $0.1, $0.2)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    perform body: (A, B, C, D) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    perform body: (A, B, C, D, E) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    perform body: (A, B, C, D, E, F) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    perform body: (A, B, C, D, E, F, G) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    perform body: (A, B, C, D, E, F, G, H) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    perform body: (A, B, C, D, E, F, G, H, I) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    _ g20: Generator<U, some Sequence<U>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19, $0.20)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    _ g20: Generator<U, some Sequence<U>>, 
    _ g21: Generator<V, some Sequence<V>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19, $0.20, $0.21)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    _ g20: Generator<U, some Sequence<U>>, 
    _ g21: Generator<V, some Sequence<V>>, 
    _ g22: Generator<W, some Sequence<W>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19, $0.20, $0.21, $0.22)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    _ g20: Generator<U, some Sequence<U>>, 
    _ g21: Generator<V, some Sequence<V>>, 
    _ g22: Generator<W, some Sequence<W>>, 
    _ g23: Generator<X, some Sequence<X>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19, $0.20, $0.21, $0.22, $0.23)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    _ g20: Generator<U, some Sequence<U>>, 
    _ g21: Generator<V, some Sequence<V>>, 
    _ g22: Generator<W, some Sequence<W>>, 
    _ g23: Generator<X, some Sequence<X>>, 
    _ g24: Generator<Y, some Sequence<Y>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19, $0.20, $0.21, $0.22, $0.23, $0.24)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
>(
    count: Int = 100,
    input g0: Generator<A, some Sequence<A>>,
    _ g1: Generator<B, some Sequence<B>>, 
    _ g2: Generator<C, some Sequence<C>>, 
    _ g3: Generator<D, some Sequence<D>>, 
    _ g4: Generator<E, some Sequence<E>>, 
    _ g5: Generator<F, some Sequence<F>>, 
    _ g6: Generator<G, some Sequence<G>>, 
    _ g7: Generator<H, some Sequence<H>>, 
    _ g8: Generator<I, some Sequence<I>>, 
    _ g9: Generator<J, some Sequence<J>>, 
    _ g10: Generator<K, some Sequence<K>>, 
    _ g11: Generator<L, some Sequence<L>>, 
    _ g12: Generator<M, some Sequence<M>>, 
    _ g13: Generator<N, some Sequence<N>>, 
    _ g14: Generator<O, some Sequence<O>>, 
    _ g15: Generator<P, some Sequence<P>>, 
    _ g16: Generator<Q, some Sequence<Q>>, 
    _ g17: Generator<R, some Sequence<R>>, 
    _ g18: Generator<S, some Sequence<S>>, 
    _ g19: Generator<T, some Sequence<T>>, 
    _ g20: Generator<U, some Sequence<U>>, 
    _ g21: Generator<V, some Sequence<V>>, 
    _ g22: Generator<W, some Sequence<W>>, 
    _ g23: Generator<X, some Sequence<X>>, 
    _ g24: Generator<Y, some Sequence<Y>>, 
    _ g25: Generator<Z, some Sequence<Z>>, 
    perform body: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(
        count: count, 
        input: zip(g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25), 
        perform: {
            try await body($0.0, $0.1, $0.2, $0.3, $0.4, $0.5, $0.6, $0.7, $0.8, $0.9, $0.10, $0.11, $0.12, $0.13, $0.14, $0.15, $0.16, $0.17, $0.18, $0.19, $0.20, $0.21, $0.22, $0.23, $0.24, $0.25)
        }, isolation: isolation, sourceLocation: sourceLocation)
}

