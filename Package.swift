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
            .exact("15.17.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Yandex/releases/download/15.17.0/TPYandexAdapter-15.17.0.xcframework.zip",
            checksum: "71a733792eb1b95497378198c9757ad23d0e089c7c8d033c64b77c761a08acb5"
        ),
    ]
)
