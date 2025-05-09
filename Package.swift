// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "FriendlyPackage",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FriendlyPackage",
            targets: ["FriendlyPackage"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FriendlyPackage",
            dependencies: [],
            path: "Sources/FriendlyPackage",
            resources: []
        )
    ]
)
