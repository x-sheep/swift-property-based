//
//  Diagonostic+NotEnoughInputs.swift
//  PropertyBasedMacros
//
//  Created by Lennard Sprong on 08/05/2025.
//

import MacroToolkit
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

func inputParameterMismatchError(_ attr: AttributeSyntax, expected: Int, actual: Int) -> some Error {
    guard case .argumentList(var list) = attr.arguments else {
        fatalError("Not an argument list")
    }

    var diagnostic = DiagnosticBuilder(for: attr)
        .message("Expected \(expected) inputs, got \(actual)")
        .messageID(domain: "PropertyBased", id: "NotEnoughInputs")

    if expected > actual {
        var fixed = attr
        var newItem = LabeledExprSyntax(expression: EditorPlaceholderExprSyntax(withText: "Gen"), trailingComma: ", ")

        list.ensureTrailingComma()

        let count = expected - actual
        for i in 0..<count {
            if i == count - 1 {
                newItem.trailingComma = nil
            }
            list.append(newItem)
        }
        fixed.arguments = .argumentList(list)
        diagnostic = diagnostic.suggestReplacement("Add missing input arguments", old: attr, new: fixed)
    }

    return DiagnosticsError(diagnostics: [diagnostic.build()])
}
