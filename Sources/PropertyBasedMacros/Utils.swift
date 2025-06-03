//
//  Utils.swift
//  PropertyBasedMacros
//
//  Created by Lennard Sprong on 08/05/2025.
//

import MacroToolkit
import SwiftSyntax

extension LabeledExprListSyntax {
    /// Make sure the last argument in the list has a trailing comma, so more items can be added.
    mutating func ensureTrailingComma() {
        if var last = self.last {
            var lastIndex = index(before: endIndex)
            if last.trimmedLength == .zero {
                lastIndex = index(before: lastIndex)
                last = self[lastIndex]
            }

            last.trailingComma = ", "
            self[lastIndex] = last
        }
    }
}

extension AttributeListElement {
    var attributeName: String {
        return attribute?._syntax.attributeName.description ?? ""
    }
}

let invalidSpecifiers: Set<String> = ["inout", "isolated"]

extension FunctionParameter {
    var unsupportedSpecifier: String? {
        guard let attrs = self.type._attributedSyntax else { return nil }
        return attrs.specifiers.map(\.trimmedDescription).first(where: { invalidSpecifiers.contains($0) })
    }
}
