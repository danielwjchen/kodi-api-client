import Foundation

struct EpisodeCollectionRequest: Request, Codable {
    var jsonrpc: String = "2.0";
    var id: Int;
    var method: String = "VideoLibrary.GetEpisodes";
    var params: EpisodeCollectionRequestParams = EpisodeCollectionRequestParams(
        properties: [
            .title,
            .thumbnail,
            .playcount,
            .lastplayed,
            .dateadded,
            .episode,
            .season,
            .rating,
            .file,
            .cast,
            .showtitle,
            .tvshowid,
            .uniqueid,
            .resume,
            .firstaired,
            .fanart,
        ],
        limits: RequestLimits(start: 0, end: 10),
        sort: RequestSort(method: .dateadded, order: .descending)
    );
}

struct EpisodeCollectionResponseResult: Codable {
    var limits: ResponseLimits;
    var movies: [Episode];
}

struct EpisodeCollectionResponse: Codable {
    var id: Int;
    var jsonrpc: String = "2.0";
    var result: EpisodeCollectionResponseResult;
}