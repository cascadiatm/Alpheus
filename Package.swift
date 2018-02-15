// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Alpheus",
    products: [
        .library(
            name: "Alpheus",
            targets: ["Alpheus"]),
    ],
    dependencies: [
      .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
    ],
    targets: [
        .target(
            name: "Alpheus",
            dependencies: []),
        .testTarget(
            name: "AlpheusTests",
            dependencies: ["Alpheus"]),
    ]
)
