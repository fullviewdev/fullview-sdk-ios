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
                "https://github.com/fullviewdev/fullview-sdk-ios/releases/download/v0.10.0/FullviewSDK.xcframework.zip",
            checksum: "49b4bb06b2bb1eb256aa44c879473a3184ed0ea486ab0d086965621246cbf415"
        )
    ]
)
