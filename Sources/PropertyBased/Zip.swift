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
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
/// - Returns: A generator of tuples.
@inlinable
public func zip<InA, InB, OutA, OutB>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
) -> Generator<
    (InA, InB),
    Shrink.TupleShrinkSequence<(InA, InB)>,
    (OutA, OutB)
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let values = (
            v0, v1
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1))
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            true else { return nil }
        return (r0, r1)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, OutA, OutB, OutC>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
) -> Generator<
    (InA, InB, InC),
    Shrink.TupleShrinkSequence<(InA, InB, InC)>,
    (OutA, OutB, OutC)
> {
    return .init(runWithShrink: { rng in
        let (v0, s0) = p0._run(&rng)
        let (v1, s1) = p1._run(&rng)
        let (v2, s2) = p2._run(&rng)
        let values = (
            v0, v1, v2
        )
        
        return (value: values, shrink: Shrink.shrinkTuple(values, shrinkers: s0, s1, s2))
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            true else { return nil }
        return (r0, r1, r2)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, OutA, OutB, OutC, OutD>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
) -> Generator<
    (InA, InB, InC, InD),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD)>,
    (OutA, OutB, OutC, OutD)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            true else { return nil }
        return (r0, r1, r2, r3)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, OutA, OutB, OutC, OutD, OutE>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
) -> Generator<
    (InA, InB, InC, InD, InE),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE)>,
    (OutA, OutB, OutC, OutD, OutE)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            true else { return nil }
        return (r0, r1, r2, r3, r4)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, OutA, OutB, OutC, OutD, OutE, OutF>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF)>,
    (OutA, OutB, OutC, OutD, OutE, OutF)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, OutA, OutB, OutC, OutD, OutE, OutF, OutG>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
///   - p20: A generator of `OutU`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
    _ p20: Generator<InU, some Sequence<InU>, OutU>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            let r20 = p20._finalResult(input.20),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
///   - p20: A generator of `OutU`s.
///   - p21: A generator of `OutV`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
    _ p20: Generator<InU, some Sequence<InU>, OutU>, 
    _ p21: Generator<InV, some Sequence<InV>, OutV>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            let r20 = p20._finalResult(input.20),
            let r21 = p21._finalResult(input.21),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
///   - p20: A generator of `OutU`s.
///   - p21: A generator of `OutV`s.
///   - p22: A generator of `OutW`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
    _ p20: Generator<InU, some Sequence<InU>, OutU>, 
    _ p21: Generator<InV, some Sequence<InV>, OutV>, 
    _ p22: Generator<InW, some Sequence<InW>, OutW>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            let r20 = p20._finalResult(input.20),
            let r21 = p21._finalResult(input.21),
            let r22 = p22._finalResult(input.22),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
///   - p20: A generator of `OutU`s.
///   - p21: A generator of `OutV`s.
///   - p22: A generator of `OutW`s.
///   - p23: A generator of `OutX`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
    _ p20: Generator<InU, some Sequence<InU>, OutU>, 
    _ p21: Generator<InV, some Sequence<InV>, OutV>, 
    _ p22: Generator<InW, some Sequence<InW>, OutW>, 
    _ p23: Generator<InX, some Sequence<InX>, OutX>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            let r20 = p20._finalResult(input.20),
            let r21 = p21._finalResult(input.21),
            let r22 = p22._finalResult(input.22),
            let r23 = p23._finalResult(input.23),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
///   - p20: A generator of `OutU`s.
///   - p21: A generator of `OutV`s.
///   - p22: A generator of `OutW`s.
///   - p23: A generator of `OutX`s.
///   - p24: A generator of `OutY`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
    _ p20: Generator<InU, some Sequence<InU>, OutU>, 
    _ p21: Generator<InV, some Sequence<InV>, OutV>, 
    _ p22: Generator<InW, some Sequence<InW>, OutW>, 
    _ p23: Generator<InX, some Sequence<InX>, OutX>, 
    _ p24: Generator<InY, some Sequence<InY>, OutY>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            let r20 = p20._finalResult(input.20),
            let r21 = p21._finalResult(input.21),
            let r22 = p22._finalResult(input.22),
            let r23 = p23._finalResult(input.23),
            let r24 = p24._finalResult(input.24),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24)
    })
}

/// Combines multiple generators into a single one.
///
/// - Parameters:
///   - p0: A generator of `OutA`s.
///   - p1: A generator of `OutB`s.
///   - p2: A generator of `OutC`s.
///   - p3: A generator of `OutD`s.
///   - p4: A generator of `OutE`s.
///   - p5: A generator of `OutF`s.
///   - p6: A generator of `OutG`s.
///   - p7: A generator of `OutH`s.
///   - p8: A generator of `OutI`s.
///   - p9: A generator of `OutJ`s.
///   - p10: A generator of `OutK`s.
///   - p11: A generator of `OutL`s.
///   - p12: A generator of `OutM`s.
///   - p13: A generator of `OutN`s.
///   - p14: A generator of `OutO`s.
///   - p15: A generator of `OutP`s.
///   - p16: A generator of `OutQ`s.
///   - p17: A generator of `OutR`s.
///   - p18: A generator of `OutS`s.
///   - p19: A generator of `OutT`s.
///   - p20: A generator of `OutU`s.
///   - p21: A generator of `OutV`s.
///   - p22: A generator of `OutW`s.
///   - p23: A generator of `OutX`s.
///   - p24: A generator of `OutY`s.
///   - p25: A generator of `OutZ`s.
/// - Returns: A generator of tuples.
@_documentation(visibility: private)
@inlinable
public func zip<InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY, InZ, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY, OutZ>(
    _ p0: Generator<InA, some Sequence<InA>, OutA>, 
    _ p1: Generator<InB, some Sequence<InB>, OutB>, 
    _ p2: Generator<InC, some Sequence<InC>, OutC>, 
    _ p3: Generator<InD, some Sequence<InD>, OutD>, 
    _ p4: Generator<InE, some Sequence<InE>, OutE>, 
    _ p5: Generator<InF, some Sequence<InF>, OutF>, 
    _ p6: Generator<InG, some Sequence<InG>, OutG>, 
    _ p7: Generator<InH, some Sequence<InH>, OutH>, 
    _ p8: Generator<InI, some Sequence<InI>, OutI>, 
    _ p9: Generator<InJ, some Sequence<InJ>, OutJ>, 
    _ p10: Generator<InK, some Sequence<InK>, OutK>, 
    _ p11: Generator<InL, some Sequence<InL>, OutL>, 
    _ p12: Generator<InM, some Sequence<InM>, OutM>, 
    _ p13: Generator<InN, some Sequence<InN>, OutN>, 
    _ p14: Generator<InO, some Sequence<InO>, OutO>, 
    _ p15: Generator<InP, some Sequence<InP>, OutP>, 
    _ p16: Generator<InQ, some Sequence<InQ>, OutQ>, 
    _ p17: Generator<InR, some Sequence<InR>, OutR>, 
    _ p18: Generator<InS, some Sequence<InS>, OutS>, 
    _ p19: Generator<InT, some Sequence<InT>, OutT>, 
    _ p20: Generator<InU, some Sequence<InU>, OutU>, 
    _ p21: Generator<InV, some Sequence<InV>, OutV>, 
    _ p22: Generator<InW, some Sequence<InW>, OutW>, 
    _ p23: Generator<InX, some Sequence<InX>, OutX>, 
    _ p24: Generator<InY, some Sequence<InY>, OutY>, 
    _ p25: Generator<InZ, some Sequence<InZ>, OutZ>, 
) -> Generator<
    (InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY, InZ),
    Shrink.TupleShrinkSequence<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY, InZ)>,
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY, OutZ)
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
    }, finalResult: { input in
        guard
            let r0 = p0._finalResult(input.0),
            let r1 = p1._finalResult(input.1),
            let r2 = p2._finalResult(input.2),
            let r3 = p3._finalResult(input.3),
            let r4 = p4._finalResult(input.4),
            let r5 = p5._finalResult(input.5),
            let r6 = p6._finalResult(input.6),
            let r7 = p7._finalResult(input.7),
            let r8 = p8._finalResult(input.8),
            let r9 = p9._finalResult(input.9),
            let r10 = p10._finalResult(input.10),
            let r11 = p11._finalResult(input.11),
            let r12 = p12._finalResult(input.12),
            let r13 = p13._finalResult(input.13),
            let r14 = p14._finalResult(input.14),
            let r15 = p15._finalResult(input.15),
            let r16 = p16._finalResult(input.16),
            let r17 = p17._finalResult(input.17),
            let r18 = p18._finalResult(input.18),
            let r19 = p19._finalResult(input.19),
            let r20 = p20._finalResult(input.20),
            let r21 = p21._finalResult(input.21),
            let r22 = p22._finalResult(input.22),
            let r23 = p23._finalResult(input.23),
            let r24 = p24._finalResult(input.24),
            let r25 = p25._finalResult(input.25),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25)
    })
}

