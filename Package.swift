// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonSwiftUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CommonSwiftUI",
            targets: ["CommonSwiftUI"]),
    ],
    targets: [
        .binaryTarget(
            name: "CommonSwiftUI",
            path: "./Sources/CommonSwiftUI.xcframework")
    ]
)
