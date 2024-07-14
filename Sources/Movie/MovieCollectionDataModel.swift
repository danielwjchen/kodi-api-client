import Foundation

typealias MovieCollectionRequestParams = RequestParams<MovieFields>;

struct MovieCollectionResponseResult: Codable {
    var limits: ResponseLimits;
    var movies: [Movie];
}

typealias MovieCollectionResponse = Response<MovieCollectionResponseResult>;