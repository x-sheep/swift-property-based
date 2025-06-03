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
    InA, InB, OutA, OutB,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    perform body: (OutA, OutB) async throws -> Void,
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
    InA, InB, InC, OutA, OutB, OutC,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    perform body: (OutA, OutB, OutC) async throws -> Void,
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
    InA, InB, InC, InD, OutA, OutB, OutC, OutD,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    perform body: (OutA, OutB, OutC, OutD) async throws -> Void,
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
    InA, InB, InC, InD, InE, OutA, OutB, OutC, OutD, OutE,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    _ g4: Generator<OutE, some Sequence<InE>>,
    perform body: (OutA, OutB, OutC, OutD, OutE) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, OutA, OutB, OutC, OutD, OutE, OutF,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    _ g4: Generator<OutE, some Sequence<InE>>,
    _ g5: Generator<OutF, some Sequence<InF>>,
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, OutA, OutB, OutC, OutD, OutE, OutF, OutG,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    _ g4: Generator<OutE, some Sequence<InE>>,
    _ g5: Generator<OutF, some Sequence<InF>>,
    _ g6: Generator<OutG, some Sequence<InG>>,
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    _ g4: Generator<OutE, some Sequence<InE>>,
    _ g5: Generator<OutF, some Sequence<InF>>,
    _ g6: Generator<OutG, some Sequence<InG>>,
    _ g7: Generator<OutH, some Sequence<InH>>,
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    _ g4: Generator<OutE, some Sequence<InE>>,
    _ g5: Generator<OutF, some Sequence<InF>>,
    _ g6: Generator<OutG, some Sequence<InG>>,
    _ g7: Generator<OutH, some Sequence<InH>>,
    _ g8: Generator<OutI, some Sequence<InI>>,
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ,
>(
    count: Int = 100,
    input g0: Generator<OutA, some Sequence<InA>>,
    _ g1: Generator<OutB, some Sequence<InB>>,
    _ g2: Generator<OutC, some Sequence<InC>>,
    _ g3: Generator<OutD, some Sequence<InD>>,
    _ g4: Generator<OutE, some Sequence<InE>>,
    _ g5: Generator<OutF, some Sequence<InF>>,
    _ g6: Generator<OutG, some Sequence<InG>>,
    _ g7: Generator<OutH, some Sequence<InH>>,
    _ g8: Generator<OutI, some Sequence<InI>>,
    _ g9: Generator<OutJ, some Sequence<InJ>>,
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ) async throws -> Void,
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
