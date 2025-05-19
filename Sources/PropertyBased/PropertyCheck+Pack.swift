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

/// See ``propertyCheck(count:input:perform:isolation:sourceLocation:)``
@_documentation(visibility: private)
@inlinable
public func propertyCheck<
    InA, InB, InC, InD, InE, InF, InG, InH, InI, InJ, InK, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, OutI, OutJ, OutK,
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
    _ g20: Generator<OutU, some Sequence<InU>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
    _ g20: Generator<OutU, some Sequence<InU>>, 
    _ g21: Generator<OutV, some Sequence<InV>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
    _ g20: Generator<OutU, some Sequence<InU>>, 
    _ g21: Generator<OutV, some Sequence<InV>>, 
    _ g22: Generator<OutW, some Sequence<InW>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
    _ g20: Generator<OutU, some Sequence<InU>>, 
    _ g21: Generator<OutV, some Sequence<InV>>, 
    _ g22: Generator<OutW, some Sequence<InW>>, 
    _ g23: Generator<OutX, some Sequence<InX>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
    _ g20: Generator<OutU, some Sequence<InU>>, 
    _ g21: Generator<OutV, some Sequence<InV>>, 
    _ g22: Generator<OutW, some Sequence<InW>>, 
    _ g23: Generator<OutX, some Sequence<InX>>, 
    _ g24: Generator<OutY, some Sequence<InY>>, 
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
    _ g10: Generator<OutK, some Sequence<InK>>, 
    _ g11: Generator<OutL, some Sequence<InL>>, 
    _ g12: Generator<OutM, some Sequence<InM>>, 
    _ g13: Generator<OutN, some Sequence<InN>>, 
    _ g14: Generator<OutO, some Sequence<InO>>, 
    _ g15: Generator<OutP, some Sequence<InP>>, 
    _ g16: Generator<OutQ, some Sequence<InQ>>, 
    _ g17: Generator<OutR, some Sequence<InR>>, 
    _ g18: Generator<OutS, some Sequence<InS>>, 
    _ g19: Generator<OutT, some Sequence<InT>>, 
    _ g20: Generator<OutU, some Sequence<InU>>, 
    _ g21: Generator<OutV, some Sequence<InV>>, 
    _ g22: Generator<OutW, some Sequence<InW>>, 
    _ g23: Generator<OutX, some Sequence<InX>>, 
    _ g24: Generator<OutY, some Sequence<InY>>, 
    _ g25: Generator<OutZ, some Sequence<InZ>>, 
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

