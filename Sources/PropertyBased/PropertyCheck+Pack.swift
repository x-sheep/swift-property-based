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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
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
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
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

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    _ g20: Generator<some Sequence<InU>, OutU>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    _ g20: Generator<some Sequence<InU>, OutU>, 
    _ g21: Generator<some Sequence<InV>, OutV>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    _ g20: Generator<some Sequence<InU>, OutU>, 
    _ g21: Generator<some Sequence<InV>, OutV>, 
    _ g22: Generator<some Sequence<InW>, OutW>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    _ g20: Generator<some Sequence<InU>, OutU>, 
    _ g21: Generator<some Sequence<InV>, OutV>, 
    _ g22: Generator<some Sequence<InW>, OutW>, 
    _ g23: Generator<some Sequence<InX>, OutX>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    _ g20: Generator<some Sequence<InU>, OutU>, 
    _ g21: Generator<some Sequence<InV>, OutV>, 
    _ g22: Generator<some Sequence<InW>, OutW>, 
    _ g23: Generator<some Sequence<InX>, OutX>, 
    _ g24: Generator<some Sequence<InY>, OutY>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY) async throws -> Void,
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
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, InL, InM, InN, InO, InP, InQ, InR, InS, InT, InU, InV, InW, InX, InY, InZ, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY, OutZ,
>(
    count: Int = 100,
    input g0: Generator<some Sequence<InA>, OutA>,
    _ g1: Generator<some Sequence<InB>, OutB>, 
    _ g2: Generator<some Sequence<InC>, OutC>, 
    _ g3: Generator<some Sequence<InD>, OutD>, 
    _ g4: Generator<some Sequence<InE>, OutE>, 
    _ g5: Generator<some Sequence<InF>, OutF>, 
    _ g6: Generator<some Sequence<InG>, OutG>, 
    _ g7: Generator<some Sequence<InH>, OutH>, 
    _ g8: Generator<some Sequence<InI>, OutI>, 
    _ g9: Generator<some Sequence<InJ>, OutJ>, 
    _ g10: Generator<some Sequence<InK>, OutK>, 
    _ g11: Generator<some Sequence<InL>, OutL>, 
    _ g12: Generator<some Sequence<InM>, OutM>, 
    _ g13: Generator<some Sequence<InN>, OutN>, 
    _ g14: Generator<some Sequence<InO>, OutO>, 
    _ g15: Generator<some Sequence<InP>, OutP>, 
    _ g16: Generator<some Sequence<InQ>, OutQ>, 
    _ g17: Generator<some Sequence<InR>, OutR>, 
    _ g18: Generator<some Sequence<InS>, OutS>, 
    _ g19: Generator<some Sequence<InT>, OutT>, 
    _ g20: Generator<some Sequence<InU>, OutU>, 
    _ g21: Generator<some Sequence<InV>, OutV>, 
    _ g22: Generator<some Sequence<InW>, OutW>, 
    _ g23: Generator<some Sequence<InX>, OutX>, 
    _ g24: Generator<some Sequence<InY>, OutY>, 
    _ g25: Generator<some Sequence<InZ>, OutZ>, 
    perform body: (OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK, OutL, OutM, OutN, OutO, OutP, OutQ, OutR, OutS, OutT, OutU, OutV, OutW, OutX, OutY, OutZ) async throws -> Void,
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

