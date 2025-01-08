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
                "https://github.com/fullviewdev/fullview-sdk-ios/releases/download/v0.9.7/FullviewSDK.xcframework.zip",
            checksum: "30ea148323898447854fc491bcd307fbb724dbbc497311963a44e7e583423118"
        )
    ]
)
