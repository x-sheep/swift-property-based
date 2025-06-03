// swift-tools-version: 6.1

import CompilerPluginSupport
import PackageDescription

#if swift(>=6.2)
let shrinkByDefault = true
#else
let shrinkByDefault = false
#endif

let package = Package(
    name: "PropertyBased",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "PropertyBased",
            targets: ["PropertyBased"]
        )
    ],
    traits: [
        .default(enabledTraits: shrinkByDefault ? ["EnableShrinking"] : []),
        .trait(
            name: "EnableShrinking",
            description:
                "This trait enables the shrinker by default. Regardless of this trait being set, you can use the shrinking() TestTrait to enable/disable the shrinker on a case-by-case basis."
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.1"),
        .package(
            url: "https://github.com/stackotter/swift-macro-toolkit.git",
            revision: "ec8c5cf3b95cf9b0e1d4df6a0b2e0f524ae41558"),
    ],
    targets: [
        .target(
            name: "PropertyBased",
            dependencies: [
                "PropertyBasedMacros"
            ]),
        .macro(
            name: "PropertyBasedMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "MacroToolkit", package: "swift-macro-toolkit"),
            ]
        ),
        .testTarget(
            name: "PropertyBasedTests",
            dependencies: ["PropertyBased"],
            exclude: ["ZipTests.swift.gyb"]
        ),
    ]
)
