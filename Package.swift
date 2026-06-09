// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "1.53.0-beta.0"..<"1.53.99"
let banubaLicenseServicingVersionRange: Range<Version> = "1.53.0-beta.0"..<"1.53.99"

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
    .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", banubaUtilsVersionRange),
    .package(url: "https://github.com/Banuba/BanubaLicenseServicingSDK.git", banubaLicenseServicingVersionRange)
  ],
  targets: [
    // Local development uses the path-based binaryTarget below.
    // Release flow (fastlane patch_package_swift_for_nexus) replaces it in the GitHub distribution repo with:
    // .binaryTarget(
    //   name: "BanubaAudioBrowserSDK",
    //   url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaAudioBrowserSDK/{version}/BanubaAudioBrowserSDK-{version}.xcframework.zip",
    //   checksum: "{computed at release}"
    // )
    .binaryTarget(
      name: "BanubaAudioBrowserSDK",
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaAudioBrowserSDK/1.53.0-beta.2/BanubaAudioBrowserSDK-1.53.0-beta.2.xcframework.zip",
      checksum: "48a501f2ba9fbc7dfd4c465411fe42b82ee2430b3c8e53596f4285745d3e929c"
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
        .product(name: "BanubaUtilities", package: "BanubaUtilities-iOS"),
        .product(name: "BanubaLicenseServicingSDK", package: "BanubaLicenseServicingSDK")
      ],
      path: "BanubaAudioBrowserSDKWrapper"
    )
  ]
)
