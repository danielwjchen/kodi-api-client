import Foundation;

struct MovieDetailsService {
    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();
    let method: String = "VideoLibrary.GetMovieDetails";

    init(_ baseUrl: String){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?Movie")!;
    }

    func getMovieDetails(
        movieId: Int
    ) async throws -> MovieDetailsResponse {
        let movieDetailsRequest: Request<MovieDetailsRequestParams> = Request<MovieDetailsRequestParams>(
            id: getId(),
            method: self.method,
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
                    .plotoutline,
                    .imdbnumber,
                    .runtime,
                    .streamdetails,
                    .plot,
                    .trailer,
                    .sorttitle,
                    .originaltitle,
                    .country,
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