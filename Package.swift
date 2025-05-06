// swift-tools-version: 6.1

import PackageDescription

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
    ],
    targets: [
        .target(name: "PropertyBased", dependencies: [
            .product(name: "Gen", package: "swift-gen"),
        ]),
        .testTarget(
            name: "PropertyBasedTests",
            dependencies: ["PropertyBased"]
        ),
    ]
)
