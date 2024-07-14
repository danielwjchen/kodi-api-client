// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "KodiApiClient",
    platforms: [.macOS("10.15"),.tvOS("13.0")],
    // products: [
    //     .library(
    //         name: "KodiApiClient",
    //         targets: ["KodiApiClient"]
    //     ),
    // ],
    targets: [
        .executableTarget(
            name: "KodiApiClient",
            path: "Sources"),
        // .target(name: "KodiApiClient"),
        .testTarget(
            name: "KodiApiClientTests",
            dependencies: ["KodiApiClient"],
            resources: [
                .process("Resources/api-schema.json"),
                .process("Resources/episode.recently-added.request.json"),
                .process("Resources/episode.recently-added.response.json"),
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
