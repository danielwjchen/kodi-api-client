import Foundation;

struct MovieCollectionService {
    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();
    let method: String = "VideoLibrary.GetMovies";

    init(_ baseUrl: String){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?MovieCollection")!;
    }

    func getMovies(
        requestFilter: RequestFilter? = nil,
        requestSort: RequestSort? = nil,
        requestLimits: RequestLimits? = nil
    ) async throws -> MovieCollectionResponse {
        var params: MovieRequestParams = MovieRequestParams(
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
            ],
            limits: requestLimits ?? RequestLimits(),
            sort: requestSort ?? RequestSort()
        )
        if requestFilter != nil {
            params.filter = requestFilter;
        }
        let movieCollectionRequest: Request<MovieRequestParams> = Request<MovieRequestParams>(
            id: getId(),
            method: self.method,
            params: params
        );
        let httpBody: Data = try self.encoder.encode(movieCollectionRequest);
        let urlRequest: URLRequest = createUrlRequest(
            url: self.url, httpMethod: "POST", httpBody: httpBody
        );
        let (data, _) = try await URLSession.shared.data(for: urlRequest);
        let result: MovieCollectionResponse  = try! self.decoder.decode(
            MovieCollectionResponse.self, from: data
        );
        return result;
    }

    func getRecentlyAdded() async throws -> MovieCollectionResponse {
        let requestFilter: RequestFilter = RequestFilter(operator: "is", field: "playcount", value: "0")
        return try await self.getMovies(requestFilter: requestFilter);
    }

    func getRandom() async throws -> MovieCollectionResponse {
        let requestSort: RequestSort = RequestSort(
            method: .random, order: .descending
        );
        return try await self.getMovies(requestSort: requestSort);
    }

    func getContinueWatching() async throws -> MovieCollectionResponse {
        let requestFilter: RequestFilter = RequestFilter(operator: "true", field: "inprogress", value: "")
        return try await self.getMovies(requestFilter: requestFilter);
    }
}