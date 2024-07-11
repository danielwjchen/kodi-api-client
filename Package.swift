// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KodiApiClient",
    platforms: [.macOS("10.15"),.tvOS("13.0")],
    targets: [
        .executableTarget(
            name: "KodiApiClient",
            path: "Sources"),
        .testTarget(
            name: "KodiApiClientTests",
            dependencies: ["KodiApiClient"],
            resources: [
                .process("Resources/api-schema.json"),
                .process("Resources/episode.recently-added.request.json"),
                .process("Resources/episode.recently-added.response.json"),
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
