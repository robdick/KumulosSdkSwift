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
            // just for testing: forked from Kumulos/KSCrash which has the Package.swift added from kstenerud/KSCrash so we can import our fork in here with SPM support
            url: "https://github.com/robdick/KSCrash",
            .branch("master")
        ),
    ],
    targets: [
        .target(
            name: "ObjCSources",
            dependencies: [],
            path: "ObjCSources",
            linkerSettings: [
                .linkedFramework("UIKit"),
            ]
        ),
        .target(
            name: "KumulosSdkSwift",
            dependencies: [
                "ObjCSources",
                "KSCrash"
            ],
            path: "Sources",
            exclude: [
                "Extension"
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("MessageUI"),
                .linkedLibrary("libc++"),
                .linkedLibrary("libz")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
