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
            linkerSettings: [
                .linkedLibrary("KSCrash"),
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
