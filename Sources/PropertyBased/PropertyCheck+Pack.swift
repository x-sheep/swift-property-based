//
//  PropertyCheck+Pack.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 17/05/2025.
//

import Testing

public func propertyCheck<V1, V2>(
    count: Int = 100,
    input g1: Gen<V1, some Sequence<V1>>,
    _ g2: Gen<V2, some Sequence<V2>>,
    perform body: (V1, V2) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(count: count, input: zip(g1, g2), perform: { tuple in
        try await body(tuple.0, tuple.1)
    }, isolation: isolation, sourceLocation: sourceLocation)
}

public func propertyCheck<V1, V2, V3>(
    count: Int = 100,
    input g1: Gen<V1, some Sequence<V1>>,
    _ g2: Gen<V2, some Sequence<V2>>,
    _ g3: Gen<V3, some Sequence<V3>>,
    perform body: (V1, V2, V3) async throws -> Void,
    isolation: isolated (any Actor)? = #isolation,
    sourceLocation: SourceLocation = #_sourceLocation
) async {
    await propertyCheck(count: count, input: zip(g1, g2, g3), perform: { tuple in
        try await body(tuple.0, tuple.1, tuple.2)
    }, isolation: isolation, sourceLocation: sourceLocation)
}
