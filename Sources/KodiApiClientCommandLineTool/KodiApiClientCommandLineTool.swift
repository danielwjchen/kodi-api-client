import ArgumentParser
import Foundation
import KodiApiClient

@main
struct KodiApiClientCommandLineTool : AsyncParsableCommand {

    @Argument(help: "URL of the Kodi instance")
    var url: String;

    @Option(help: "Get movie detail")
    var getMovieDetails: Int?;

    @Option(help: "Get random movies")
    var getRandomMovies: Int?;

    @Option(help: "Get recently added movies")
    var getRecentlyAddedMovies: Int?;

    @Option(help: "Get in-progress movies")
    var getInProgressMovies: Int?;

    @Option(help: "Prints json output in a pretty format")
    var pretty: Bool = true;

    mutating func run() async throws {
        let kodiApiClient = KodiApiClient(self.url);
        let encoder = JSONEncoder();
        if self.pretty {
            encoder.outputFormatting = [.prettyPrinted];
        }

        if let movieId = getMovieDetails {
            let response = try await kodiApiClient.getMovieDetails(movieId);
            let data = try encoder.encode(response);
            if let result: String = String(data: data, encoding: .utf8) {
                print(result)
            }
        } else if let limit = getRandomMovies {
            let response = try await kodiApiClient.getMovieCollectionService().getRandom(
                limit: limit
            );
            let data = try encoder.encode(response);
            if let result: String = String(data: data, encoding: .utf8) {
                print(result)
            }
        } else if let limit = getRecentlyAddedMovies {
            let response = try await kodiApiClient.getMovieCollectionService().getRecentlyAdded(
                limit: limit
            );
            let data = try encoder.encode(response);
            if let result: String = String(data: data, encoding: .utf8) {
                print(result)
            }
        } else if let limit = getInProgressMovies {
            let response = try await kodiApiClient.getMovieCollectionService().getInProgress(
                limit: limit
            );
            let data = try encoder.encode(response);
            if let result: String = String(data: data, encoding: .utf8) {
                print(result)
            }
        } else {
            print("Please specify an option!")
        }
    }
}