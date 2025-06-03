//
//  Property+Macro.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 08/05/2025.
//

import Testing

@attached(peer)
public macro PropertyTest(_ traits: any TestTrait..., count: Int = 100, input: Any...) =
    #externalMacro(module: "PropertyBasedMacros", type: "PropertyMacro")

@attached(peer)
public macro PropertyTest(_ displayName: String, _ traits: any TestTrait..., count: Int = 100, input: Any...) =
    #externalMacro(module: "PropertyBasedMacros", type: "PropertyMacro")
