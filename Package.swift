// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HTTPDecoratorKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "HTTPDecoratorKit",
            targets: ["HTTPDecoratorKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HTTPDecoratorKit",
            dependencies: []),
        .testTarget(
            name: "HTTPDecoratorKitTests",
            dependencies: ["HTTPDecoratorKit"]),
    ],
    swiftLanguageVersions: [.v5]
)
