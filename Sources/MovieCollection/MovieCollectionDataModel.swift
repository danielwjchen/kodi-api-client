import Foundation

typealias MovieRequestParams = RequestParams<MovieFields>;

struct MovieCollectionResponseResult: Codable {
    var limits: ResponseLimits;
    var movies: [Movie];
}

typealias MovieCollectionResponse = Response<MovieCollectionResponseResult>;