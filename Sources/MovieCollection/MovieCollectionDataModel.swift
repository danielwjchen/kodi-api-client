//
//  MovieCollectionDataModel.swift
//
//  Created by Daniel Chen on 7/4/24.
//

import Foundation

struct RequestParams: Codable {
    var properties: [VideoFieldsMovie];
    var limits: RequestLimits;
    var sort: RequestSort;
    var filter: RequestFilter?;
}

struct RequestFilter: Codable {
    var `operator`: String;
    var field: String;
    var value: String;
}

struct MovieCollectionRequest: Request, Codable {
    var jsonrpc: String = "2.0";
    var id: Int;
    var method: String = "VideoLibrary.GetMovies";
    var params: RequestParams = RequestParams(
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

struct VideoCast: Codable {
    var name: String;
    var order: Int;
    var role: String;
    var thumbnail: String?;
}

struct VideoResume: Codable {
    var position: Int;
    var total: Int;
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