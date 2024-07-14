import Foundation

struct MovieRequestParams: RequestParams {
    var properties: [MovieFields];
    var limits: RequestLimits;
    var sort: RequestSort;
    var filter: RequestFilter?;
}

struct MovieCollectionRequest: Request, Codable {
    var jsonrpc: String = "2.0";
    var id: Int;
    var method: String = "VideoLibrary.GetMovies";
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
        limits: RequestLimits(start: 0, end: 10),
        sort: RequestSort(method: .dateadded, order: .descending)
    );
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