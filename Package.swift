// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let isDevelop = true

let developProducts: [Product] = isDevelop ? [
] : []

let developTargets: [Target] = isDevelop ? [
    .testTarget(
        name: "SwiftShellTests",
        dependencies: ["SwiftShell"]),
] : []

let package = Package(
    name: "SwiftShell",
    products: [
        .library(
            name: "SwiftShell",
            targets: ["SwiftShell"]),
    ] + developProducts,
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftShell",
            dependencies: []),
    ] + developTargets
)
