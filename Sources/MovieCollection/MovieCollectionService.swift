import Foundation;

struct MovieCollectionService {
    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();

    init(_ baseUrl: String){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?MovieCollection")!;
    }

    func getMovies(
        requestFilter: RequestFilter? = nil,
        requestSort: RequestSort? = nil,
        RequestLimits: RequestLimits? = nil
    ) async throws -> MovieCollectionResponse {
        var movieCollectionRequest: MovieCollectionRequest = MovieCollectionRequest(
            id: getId()
        );
        if let requestFilter: RequestFilter = requestFilter {
            movieCollectionRequest.params.filter = requestFilter;
        }
        if let requestSort: RequestSort = requestSort {
            movieCollectionRequest.params.sort  = requestSort;
        }
        if let requestLimits: RequestLimits = RequestLimits {
            movieCollectionRequest.params.limits = requestLimits;
        }
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