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
      url: "https://nexus.banuba.net/repository/ios-frameworks/ios/frameworks/BanubaAudioBrowserSDK/1.54.1/BanubaAudioBrowserSDK-1.54.1.xcframework.zip",
      checksum: "31e5bf2b0b2fa4bced4ced0f08c22dc3e9481e953d97d053a2009bb64160d625"
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
