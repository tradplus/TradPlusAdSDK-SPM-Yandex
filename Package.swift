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
            .exact("15.18.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Yandex/releases/download/15.18.0/TPYandexAdapter-15.18.0.xcframework.zip",
            checksum: "af41447a67601e230efc6b2372a5cb96e279b0da651341548ce92b8fc1f6c239"
        ),
    ]
)
