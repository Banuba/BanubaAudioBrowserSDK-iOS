// swift-tools-version:5.3
import PackageDescription
let package = Package(
  name: "BanubaAudioBrowserSDK",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(
      name: "BanubaAudioBrowserSDK",
      targets: ["BanubaAudioBrowserSDK"])
  ],
  targets: [
    .binaryTarget(
      name: "BanubaAudioBrowserSDK",
      path: "BanubaAudioBrowserSDK.xcframework")
  ])
