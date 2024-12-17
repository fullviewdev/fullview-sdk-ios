// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FullviewSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FullviewSDK",
            targets: [
                "FullviewSDK"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/daily-co/daily-client-ios", from: "0.25.0")
    ],
    targets: [
        .binaryTarget(
            name: "FullviewSDK",
            url:
                "https://github.com/fullviewdev/fullview-sdk-ios/releases/download/v0.9.2/FullviewSDK.xcframework.zip",
            checksum: "50f0a6f3fc97447c810b1cedf3ca06977bacc2a2eba78ab05b8eca7a28459c52"
        )
    ]
)
