// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Alpheus",
    products: [
        .library(
            name: "AlpheusLib",
            targets: ["Alpheus"]),
    ],
    dependencies: [
      .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
      .package(url: "https://github.com/iamjono/JSONConfig.git", from: "3.0.0"),
      .package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", from: "3.0.0"),
      .package(url: "https://github.com/iamjono/SwiftString.git", from: "2.0.0"),
      .package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", from: "3.0.0"),
      .package(url: "https://github.com/SwiftORM/SQLite-StORM.git", from: "3.0.0"),
      .package(url: "https://github.com/weichsel/ZIPFoundation/", .upToNextMajor(from: "0.9.0")),
    ],
    targets: [
        .target(
            name: "Alpheus",
            dependencies: ["PerfectHTTPServer","JSONConfig","SQLiteStORM","PerfectRequestLogger","SwiftString", "PerfectCURL"]),
        .testTarget(
            name: "AlpheusTests",
            dependencies: ["Alpheus"]),
    ]
)
