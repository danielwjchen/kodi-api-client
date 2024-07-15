import Foundation

public typealias MovieCollectionRequestParams = RequestParams<MovieFields>;

public struct MovieCollectionResponseResult: Codable {
    public var limits: ResponseLimits;
    public var movies: [Movie];
}

public typealias MovieCollectionResponse = Response<MovieCollectionResponseResult>;