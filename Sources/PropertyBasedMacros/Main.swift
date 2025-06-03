//
//  Main.swift
//  PropertyBasedMacros
//
//  Created by Lennard Sprong on 08/05/2025.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct PropertyBasedMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        PropertyMacro.self
    ]
}
