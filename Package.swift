// swift-tools-version:5.9

import PackageDescription

let utilsVersionRange: Range<Version> = "1.40.0"..<"1.49.99"

let package = Package(
    name: "BanubaAudioBrowserSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BanubaAudioBrowserSDK",
            targets: [
                "BanubaAudioBrowserSDKTarget"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", utilsVersionRange),
    ],
    targets: [
        .binaryTarget(
            name: "BanubaAudioBrowserSDK",
            path: "BanubaAudioBrowserSDK.xcframework"
        ),
        .target(
          name: "BanubaAudioBrowserSDKTarget",
          dependencies: [
            .target(name: "BanubaAudioBrowserSDKWrapper")
          ],
          path: "BanubaAudioBrowserSDKTarget"
        ),
        .target(
          name: "BanubaAudioBrowserSDKWrapper",
          dependencies: [
            "BanubaAudioBrowserSDK",
            .product(name: "BanubaUtilities", package: "BanubaUtilities-iOS")
          ],
          path: "BanubaAudioBrowserSDKWrapper"
        )
    ]
)
