//
//  Diagonostic+NoInputs.swift
//  PropertyBasedMacros
//
//  Created by Lennard Sprong on 08/05/2025.
//

import MacroToolkit
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

func noInputError(_ node: AttributeSyntax) -> some Error {
    var fixed = node

    var list: LabeledExprListSyntax = []
    if case .argumentList(let existing) = fixed.arguments {
        list = existing
    }
    let newItem = LabeledExprSyntax(label: "input", expression: EditorPlaceholderExprSyntax(withText: "Gen"))

    list.ensureTrailingComma()

    list.append(newItem)
    fixed.arguments = .argumentList(list)
    if fixed.leftParen == nil {
        fixed.leftParen = "("
        fixed.rightParen = ")"
    }

    let diagnostic = DiagnosticBuilder(for: node)
        .message("The input argument to @PropertyTest is required")
        .messageID(domain: "PropertyBased", id: "NoInputs")
        .suggestReplacement("Add input argument", old: node, new: fixed)
        .build()

    return DiagnosticsError(diagnostics: [diagnostic])
}
