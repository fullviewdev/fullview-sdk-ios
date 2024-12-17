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
                "https://github.com/fullviewdev/fullview-sdk-ios/releases/download/v0.9.1/FullviewSDK.xcframework.zip",
            checksum: "1d1c03bf645a68a34519ca8e72680a5216bb0bc04166f576afe263b2026626bb"
        )
    ]
)
