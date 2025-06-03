// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "PropertyBased",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "PropertyBased",
            targets: ["PropertyBased"]
        )
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
