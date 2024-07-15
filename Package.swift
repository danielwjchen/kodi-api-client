// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "KodiApiClient",
    platforms: [.macOS("10.15"),.tvOS("13.0"), .iOS("13.0"), .watchOS("6.0")],
    products: [
        .library(
            name: "KodiApiClient",
            targets: ["KodiApiClient"]
        ),
        .executable(
            name: "KodiApiClientCommandLineTool",
            targets: ["KodiApiClientCommandLineTool"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.4.0"),
    ],
    targets: [
        .target(name: "KodiApiClient"),
        .executableTarget(
            name: "KodiApiClientCommandLineTool",
            dependencies: [
                "KodiApiClient",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "KodiApiClientTests",
            dependencies: ["KodiApiClient"],
            resources: [
                .process("Resources/api-schema.json"),
                .process("Resources/episode.request.json"),
                .process("Resources/episode.response.json"),
                .process("Resources/episodes.recently-added.request.json"),
                .process("Resources/episodes.recently-added.response.json"),
                .process("Resources/movie.request.json"),
                .process("Resources/movie.response.json"),
                .process("Resources/movies.continue-watching.request.json"),
                .process("Resources/movies.continue-watching.response.json"),
                .process("Resources/movies.recently-added.request.json"),
                .process("Resources/movies.recently-added.response.json"),
                .process("Resources/movies.random.request.json"),
                .process("Resources/movies.random.response.json"),
                .process("Resources/tv-shows.all.request.json"),
                .process("Resources/tv-shows.all.response.json"),
            ]
        ),
    ]
)
