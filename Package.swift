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
                "https://github.com/fullviewdev/fullview-sdk-ios/releases/download/v0.9.6/FullviewSDK.xcframework.zip",
            checksum: "209dc3d104a1852583ef9482dbe1dec0b4faa5be24a5247c499e909fcda578b5"
        )
    ]
)
