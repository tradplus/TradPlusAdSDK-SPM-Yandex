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
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/yandexmobile/yandex-ads-sdk-ios",
            .exact("8.4.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Yandex/releases/download/15.15.0/TPYandexAdapter-15.15.0.xcframework.zip",
            checksum: "8b0d9e5ac80d5e8b6e6a7ec1ac3aeb6ebccf744fb01d66b088b14a2899b776ed"
        ),
    ]
)
