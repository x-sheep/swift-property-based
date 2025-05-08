// swift-tools-version: 6.1

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "PropertyBased",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "PropertyBased",
            targets: ["PropertyBased"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-gen.git", from: "0.4.0"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.1"),
        .package(url: "https://github.com/stackotter/swift-macro-toolkit.git", revision: "569627091e1fbb8745d691aeeb008e7247dedb7c"),
    ],
    targets: [
        .target(name: "PropertyBased", dependencies: [
            "PropertyBasedMacros",
            .product(name: "Gen", package: "swift-gen"),
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
            dependencies: ["PropertyBased"]
        ),
    ]
)
