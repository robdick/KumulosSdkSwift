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
    ],
    targets: [
        .target(
            name: "ObjCSources",
            dependencies: [],
            path: "ObjCSources",
            cSettings: [
                .headerSearchPath("headers"),
                .headerSearchPath("Extension/headers"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
            ]
        ),
        .target(
            name: "KumulosSdkSwift",
            dependencies: [
                "ObjCSources"
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
