// swift-tools-version: 6.1

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
    dependencies: [],
    targets: [
        .target(
            name: "PropertyBased",
            dependencies: [],
            exclude: ["PropertyCheck+Pack.swift.gyb", "Zip.swift.gyb"]
        ),
        .testTarget(
            name: "PropertyBasedTests",
            dependencies: ["PropertyBased"],
            exclude: ["ZipTests.swift.gyb"]
        ),
    ]
)
