// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "LazyVonCount",
    products: [
        .library(name: "LazyVonCount", targets: ["LazyVonCount"]),
    ],
    targets: [
        .target(name: "LazyVonCount", dependencies: []),
        .testTarget(name: "LazyVonCountTests", dependencies: ["LazyVonCount"]),
    ]
)
