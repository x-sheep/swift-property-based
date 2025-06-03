//
//  PropertyMacro.swift
//  PropertyBasedMacros
//
//  Created by Lennard Sprong on 08/05/2025.
//

import MacroToolkit
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct PropertyMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax, providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // MARK: Validation

        guard let function = Function(declaration) else {
            throw PropertyMacroError.notAFunction
        }

        if function.attributes.first(where: { $0.attributeName == "Test" || $0.attributeName.hasSuffix(".Test") })
            != nil
        {
            throw PropertyMacroError.redundantTest
        }

        let macro = MacroAttribute(node)
        let macroArguments = macro.arguments
        guard let inputIndex = macroArguments.firstIndex(where: { $0.label == "input" }) else {
            throw noInputError(node)
        }

        let countArg = macro.argument(labeled: "count")
        let countValue = countArg?._syntax.trimmedDescription ?? "100"

        let nameArg = macro.arguments.first?.expr.asStringLiteral
        let testName = nameArg?._syntax.trimmed ?? function.identifierWithParams.makeLiteralSyntax()

        let inputArgs = macroArguments[inputIndex...].prefix(while: { $0.expr._syntax.trimmedLength != .zero })
        let forwardedArgs = macroArguments[..<inputIndex].dropLast(countArg != nil ? 1 : 0).dropFirst(
            nameArg != nil ? 1 : 0)

        guard function.parameters.count == inputArgs.count else {
            throw inputParameterMismatchError(node, expected: function.parameters.count, actual: inputArgs.count)
        }

        // TODO: Raise a warning for non-void return type, like @Test does

        // MARK: Template

        let name = context.makeUniqueName("propertyBased")

        let paramNames = function.parameters.map(\.name).joined(separator: ", ")

        let callArguments = function.parameters.asPassthroughArguments.joined(separator: ", ")

        var forwardedTraits = forwardedArgs.map(\.expr._syntax.trimmedDescription).joined(separator: ", ")
        if !forwardedTraits.isEmpty {
            forwardedTraits = ", " + forwardedTraits
        }

        let checkArguments = inputArgs.map(\.expr._syntax.trimmedDescription).joined(separator: ", ")

        let suppression: ExprSyntax = !function.returnsVoid ? "_ = " : ""
        let catching: ExprSyntax = function.isThrowing ? "try " : ""
        let awaiting: ExprSyntax = function.isAsync ? "await " : ""
        let modifiers = function._syntax.modifiers
        let attributes = function.attributes.filter {
            !$0.attributeName.hasSuffix("PropertyTest")
        }.asAttributeList.trimmed

        return [
            """
            @Testing.Test(\(testName)\(raw: forwardedTraits))
            \(attributes)
            \(modifiers)func \(name)() async {
                await propertyCheck(count: \(raw: countValue), input: \(raw: checkArguments)) { \(raw: paramNames) in
                    \(suppression)\(catching)\(awaiting)\(raw: function.identifier)(\(raw: callArguments))
                }
            }
            """
        ]
    }

    public enum PropertyMacroError: Error, CustomStringConvertible {
        case notAFunction
        case redundantTest

        public var description: String {
            switch self {
            case .notAFunction:
                "Macro @PropertyTest must be set on a function declaration"
            case .redundantTest:
                "@PropertyTest attribute cannot be combined with @Test."
            }
        }
    }
}

extension EditorPlaceholderExprSyntax {
    init(withText text: String) {
        // Avoid triggering the actual placeholder tags when editing this file in Xcode
        let actualText = "<" + "#" + text + "#" + ">"
        self.init(placeholder: "\(raw: actualText)")
    }
}

extension Function {
    var identifierWithParams: String {
        let paramList = parameters.map { ($0.label ?? "_") + ":" }.joined()
        return "\(identifier)(\(paramList))"
    }
}
