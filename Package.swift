// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DotLottie",
    // Todo - When Thorvg can build for arm, add more platforms here!
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DotLottie",
            targets: ["DotLottie", "DotLottiePlayer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DotLottie",
            dependencies: ["DotLottiePlayer", "ZIPFoundation"],
            path: "Sources/DotLottie/"),
        .testTarget(
            name: "DotLottieTests",
            dependencies: ["DotLottie"]),
        .binaryTarget(
            name: "DotLottiePlayer",
            path: "./Sources/Thorvg-rust/DotLottiePlayer.xcframework"
        ),
//        .binaryTarget(
//            name: "Thorvg",
//            path: "./Sources/Thorvg/exports/framework/Thorvg.xcframework"
//        ),
    ]
)
