// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TradPlusYandexAdapter",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "TradPlusYandexAdapter",
            targets: ["TradPlusYandexAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.16.0")
        ),
        .package(
            url: "https://github.com/yandexmobile/yandex-ads-sdk-ios",
            .exact("8.5.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusYandexAdapter",
            dependencies: [
                .target(name: "TPYandexAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "YandexMobileAds", package: "yandex-ads-sdk-ios"),
            ],
            path: ".",
            sources: ["Sources/TradPlusYandexAdapter/TradPlusYandexAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPYandexAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Yandex/releases/download/15.16.0/TPYandexAdapter-15.16.0.xcframework.zip",
            checksum: "e3c9f599e489f42972f986ec83e7f32d3501ea3e361f1b71dd1efa7a43c2675b"
        ),
    ]
)
