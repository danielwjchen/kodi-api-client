import Foundation;

struct MovieDetailsService {
    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();

    init(_ baseUrl: String){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?Movie")!;
    }

    func getMovieDetails(
        movieId: Int
    ) async throws -> MovieDetailsResponse {
        let movieDetailsRequest: MovieDetailsRequest = MovieDetailsRequest(
            id: getId(),
            params: MovieDetailsRequestParams(
                movieid: movieId,
                properties: [
                    .title,
                    .art,
                    .playcount,
                    .lastplayed,
                    .dateadded,
                    .resume,
                    .rating,
                    .year,
                    .file,
                    .genre,
                    .writer,
                    .director,
                    .cast,
                    .set,
                    .studio,
                    .mpaa,
                    .tag,
                    .fanart
                ]
            )
        );
        let httpBody: Data = try self.encoder.encode(movieDetailsRequest);
        let urlRequest: URLRequest = createUrlRequest(
            url: self.url, httpMethod: "POST", httpBody: httpBody
        );
        let (data, _) = try await URLSession.shared.data(for: urlRequest);
        let result: MovieDetailsResponse  = try! self.decoder.decode(
            MovieDetailsResponse.self, from: data
        );
        return result;
    }
}