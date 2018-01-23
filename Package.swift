// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Alpheus",
    products: [
        .library(
            name: "Alpheus",
            targets: ["Alpheus", "MapReduce"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Ma-Reduce",
            dependencies: []),
        .target(
            name: "Alpheus",
            dependencies: ["MapReduce"]),
        .testTarget(
            name: "AlpheusTests",
            dependencies: ["Alpheus"]),
    ]
)
