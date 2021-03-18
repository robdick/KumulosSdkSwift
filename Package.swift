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
            url: "file:///Users/robdick/dev/KSCrash",
            .branch("add-swift-package-manifest")
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
