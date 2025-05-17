//
//  Zip.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 17/05/2025.
//

/// Combines two generators into a single one.
///
/// - Parameters:
///   - a: A generator of `A`s.
///   - b: A generator of `B`s.
/// - Returns: A generator of `(A, B)` pairs.
@inlinable
public func zip<A, B>(_ a: Gen<A, some Sequence<A>>, _ b: Gen<B, some Sequence<B>>) -> Gen<(A, B), Shrink.TupleShrinkSequence<(A, B)>> {
    return .init(runWithShrink: { rng in
        let p1 = a._run(&rng)
        let p2 = b._run(&rng)
        let values = (p1.value, p2.value)
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: p1.shrink, p2.shrink))
    })
}

@inlinable
public func zip<A, B, C>(_ a: Gen<A, some Sequence<A>>, _ b: Gen<B, some Sequence<B>>, _ c: Gen<C, some Sequence<C>>) -> Gen<(A, B, C), Shrink.TupleShrinkSequence<(A, B, C)>> {
    return .init(runWithShrink: { rng in
        let p1 = a._run(&rng)
        let p2 = b._run(&rng)
        let p3 = c._run(&rng)
        let values = (p1.value, p2.value, p3.value)
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: p1.shrink, p2.shrink, p3.shrink))
    })
}
