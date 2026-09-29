// swift-tools-version:5.9

import PackageDescription

let banubaUtilsVersionRange: Range<Version> = "1.54.1"..<"1.59.99"
let banubaLicenseServicingVersionRange: Range<Version> = "1.54.1"..<"1.59.99"

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
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaAudioBrowserSDK/1.54.4/BanubaAudioBrowserSDK-1.54.4.xcframework.zip",
      checksum: "07d8a3c52ef46147abeeda36a6dfd9bc0335a640c28989dc1a7c6f2045dbdc03"
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
