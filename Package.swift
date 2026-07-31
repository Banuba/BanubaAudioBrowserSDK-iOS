// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "1.53.1"..<"1.53.99"
let banubaLicenseServicingVersionRange: Range<Version> = "1.53.1"..<"1.53.99"

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
    .binaryTarget(
      name: "BanubaAudioBrowserSDK",
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaAudioBrowserSDK/1.53.1/BanubaAudioBrowserSDK-1.53.1.xcframework.zip",
      checksum: "ed4f15335b10c6573bef5341eb136ddc2d7c2111b208132027d14ff18ead6623"
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
