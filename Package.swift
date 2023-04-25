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
        
    ],
    targets: [
        .target(
            name: "uaidesign",
            dependencies: [
                
            ],
            resources: [
                
            ]),
    ]
)
