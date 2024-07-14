import Foundation

struct MovieRequestParams: RequestParams {
    var properties: [MovieFields];
    var limits: RequestLimits;
    var sort: RequestSort;
    var filter: RequestFilter?;
}

struct MovieCollectionResponseResult: Codable {
    var limits: ResponseLimits;
    var movies: [Movie];
}

struct MovieCollectionResponse: Codable {
    var id: Int;
    var jsonrpc: String = "2.0";
    var result: MovieCollectionResponseResult;
}