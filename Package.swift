// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "KumulosSdkSwift",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "KumulosSdkSwift",
            targets: ["KumulosSdkSwift"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/kstenerud/KSCrash.git",
            .branch("master")
        ),
    ],
    targets: [
        .target(
            name: "KumulosSdkSwift",
            dependencies: [
                "KSCrash"
            ],
            path: "Sources",
            exclude: [
                "Info.plist",
                "Extension",
                "KSBadgeObserver.h",
                "KSBadgeObserver.m",
                "KumulosSDK.h",
                "MobileProvision.h",
                "MobileProvision.m",
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
