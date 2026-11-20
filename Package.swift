// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersion: Version = "1.55.1"
let banubaLicenseServicingVersion: Version = "1.55.1"

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
    .package(url: "https://github.com/Banuba/BanubaUtilities-iOS.git", exact: banubaUtilsVersion),
    .package(url: "https://github.com/Banuba/BanubaLicenseServicingSDK.git", exact: banubaLicenseServicingVersion)
  ],
  targets: [
    .binaryTarget(
      name: "BanubaAudioBrowserSDK",
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaAudioBrowserSDK/1.55.1/BanubaAudioBrowserSDK-1.55.1.xcframework.zip",
      checksum: "c79992bff7875794656f00f2b3cede42c4d26960e9d00ef1fdf1729bdd0b8dc0"
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
