import Foundation

public typealias EpisodeCollectionRequestParams = RequestParams<EpisodeFields>;

public struct EpisodeCollectionResponseResult: Codable {
    public var limits: ResponseLimits;
    public var episodes: [Episode];
}

public typealias EpisodeCollectionResponse = Response<EpisodeCollectionResponseResult>;