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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
) -> Generator<
    (OutA, OutB),
    Shrink.Tuple<(InA, InB)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
) -> Generator<
    (OutA, OutB, OutC),
    Shrink.Tuple<(InA, InB, InC)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD),
    Shrink.Tuple<(InA, InB, InC, InD)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
    _ p4: Generator<OutE, some Sequence<InE>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD, OutE),
    Shrink.Tuple<(InA, InB, InC, InD, InE)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
            p4.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker, p4._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
            let r4 = p4._mapFilter(input.4),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
    _ p4: Generator<OutE, some Sequence<InE>>, 
    _ p5: Generator<OutF, some Sequence<InF>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD, OutE, OutF),
    Shrink.Tuple<(InA, InB, InC, InD, InE, InF)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
            p4.runFull(&rng).input,
            p5.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker, p4._shrinker, p5._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
            let r4 = p4._mapFilter(input.4),
            let r5 = p5._mapFilter(input.5),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
    _ p4: Generator<OutE, some Sequence<InE>>, 
    _ p5: Generator<OutF, some Sequence<InF>>, 
    _ p6: Generator<OutG, some Sequence<InG>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG),
    Shrink.Tuple<(InA, InB, InC, InD, InE, InF, InG)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
            p4.runFull(&rng).input,
            p5.runFull(&rng).input,
            p6.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker, p4._shrinker, p5._shrinker, p6._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
            let r4 = p4._mapFilter(input.4),
            let r5 = p5._mapFilter(input.5),
            let r6 = p6._mapFilter(input.6),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
    _ p4: Generator<OutE, some Sequence<InE>>, 
    _ p5: Generator<OutF, some Sequence<InF>>, 
    _ p6: Generator<OutG, some Sequence<InG>>, 
    _ p7: Generator<OutH, some Sequence<InH>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH),
    Shrink.Tuple<(InA, InB, InC, InD, InE, InF, InG, InH)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
            p4.runFull(&rng).input,
            p5.runFull(&rng).input,
            p6.runFull(&rng).input,
            p7.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker, p4._shrinker, p5._shrinker, p6._shrinker, p7._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
            let r4 = p4._mapFilter(input.4),
            let r5 = p5._mapFilter(input.5),
            let r6 = p6._mapFilter(input.6),
            let r7 = p7._mapFilter(input.7),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
    _ p4: Generator<OutE, some Sequence<InE>>, 
    _ p5: Generator<OutF, some Sequence<InF>>, 
    _ p6: Generator<OutG, some Sequence<InG>>, 
    _ p7: Generator<OutH, some Sequence<InH>>, 
    _ p8: Generator<OutI, some Sequence<InI>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI),
    Shrink.Tuple<(InA, InB, InC, InD, InE, InF, InG, InH, InI)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
            p4.runFull(&rng).input,
            p5.runFull(&rng).input,
            p6.runFull(&rng).input,
            p7.runFull(&rng).input,
            p8.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker, p4._shrinker, p5._shrinker, p6._shrinker, p7._shrinker, p8._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
            let r4 = p4._mapFilter(input.4),
            let r5 = p5._mapFilter(input.5),
            let r6 = p6._mapFilter(input.6),
            let r7 = p7._mapFilter(input.7),
            let r8 = p8._mapFilter(input.8),
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
    _ p0: Generator<OutA, some Sequence<InA>>, 
    _ p1: Generator<OutB, some Sequence<InB>>, 
    _ p2: Generator<OutC, some Sequence<InC>>, 
    _ p3: Generator<OutD, some Sequence<InD>>, 
    _ p4: Generator<OutE, some Sequence<InE>>, 
    _ p5: Generator<OutF, some Sequence<InF>>, 
    _ p6: Generator<OutG, some Sequence<InG>>, 
    _ p7: Generator<OutH, some Sequence<InH>>, 
    _ p8: Generator<OutI, some Sequence<InI>>, 
    _ p9: Generator<OutJ, some Sequence<InJ>>, 
) -> Generator<
    (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ),
    Shrink.Tuple<(InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ)>
> {
    return .init(
        run: { rng in (
            p0.runFull(&rng).input,
            p1.runFull(&rng).input,
            p2.runFull(&rng).input,
            p3.runFull(&rng).input,
            p4.runFull(&rng).input,
            p5.runFull(&rng).input,
            p6.runFull(&rng).input,
            p7.runFull(&rng).input,
            p8.runFull(&rng).input,
            p9.runFull(&rng).input,
        )},
        shrink: { tuple in
            Shrink.shrinkTuple(tuple, shrinkers: p0._shrinker, p1._shrinker, p2._shrinker, p3._shrinker, p4._shrinker, p5._shrinker, p6._shrinker, p7._shrinker, p8._shrinker, p9._shrinker)
        }, finalResult: { input in
        guard
            let r0 = p0._mapFilter(input.0),
            let r1 = p1._mapFilter(input.1),
            let r2 = p2._mapFilter(input.2),
            let r3 = p3._mapFilter(input.3),
            let r4 = p4._mapFilter(input.4),
            let r5 = p5._mapFilter(input.5),
            let r6 = p6._mapFilter(input.6),
            let r7 = p7._mapFilter(input.7),
            let r8 = p8._mapFilter(input.8),
            let r9 = p9._mapFilter(input.9),
            true else { return nil }
        return (r0, r1, r2, r3, r4, r5, r6, r7, r8, r9)
    })
}

