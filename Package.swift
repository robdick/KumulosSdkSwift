// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "KumulosSdk",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "KumulosSdk",
            targets: ["KumulosSdk", "KumulosSdkExtension"]),
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
            name: "KumulosSdkObjC",
            dependencies: [],
            path: "KumulosSdkObjC",
            cSettings: [
                  .headerSearchPath("include"),
            ]
        ),
        .target(
            name: "KumulosSdk",
            dependencies: [
                "KumulosSdkObjC",
                "KSCrash"
            ],
            path: "Sources",
            exclude: [
                "Extension"
            ]
        ),
         .target(
            name: "KumulosSdkExtension",
            dependencies: [
                "KumulosSdkObjC"
            ],
            path: "Sources",
            sources: [
                "Extension/CategoryHelper.swift",
                "Extension/KumulosNotificationService.swift",
                "Shared/AnalyticsHelper.swift",
                "Shared/AppGroupsHelper.swift",
                "Shared/KeyValPersistenceHelper.swift",
                "Shared/KSHttp.swift",
                "Shared/KumulosHelper.swift",
                "Shared/KumulosUserDefaultsKey.swift",
                "Shared/PendingNotification.swift",
                "Shared/PendingNotificationHelper.swift",
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
