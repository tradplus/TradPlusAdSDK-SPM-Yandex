// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusYandexAdapter",
    platforms: [
        .iOS(.v13),
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
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/yandexmobile/yandex-ads-sdk-ios",
            .exact("8.3.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Yandex/releases/download/15.14.0/TPYandexAdapter-15.14.0.xcframework.zip",
            checksum: "18574eae22e5f6a1e57fd8d4c8cb268130490fb66f7a547d6c7248285b6dfb40"
        ),
    ]
)
