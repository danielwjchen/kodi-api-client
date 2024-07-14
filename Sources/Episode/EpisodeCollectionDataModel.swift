import Foundation

typealias EpisodeCollectionRequestParams = RequestParams<EpisodeFields>;

struct EpisodeCollectionResponseResult: Codable {
    var limits: ResponseLimits;
    var episodes: [Episode];
}

typealias EpisodeCollectionResponse = Response<EpisodeCollectionResponseResult>;