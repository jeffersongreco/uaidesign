// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "uaidesign",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "uaidesign",
            targets: ["uaidesign"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftui-library/hstack-snap-to-scroll", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "uaidesign",
            dependencies: []),
    ]
)
