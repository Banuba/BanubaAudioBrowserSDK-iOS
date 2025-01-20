// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "BanubaAudioBrowserSDK",
  platforms: [
    .iOS(.v17)
  ],
  products: [
    .library(
      name: "BanubaAudioBrowserSDK",
      targets: ["BanubaAudioBrowserSDK"]
    )
  ],
  targets: [
    .binaryTarget(
      name: "BanubaAudioBrowserSDK",
      path: "BanubaAudioBrowserSDK.xcframework"
    )
  ]
)
