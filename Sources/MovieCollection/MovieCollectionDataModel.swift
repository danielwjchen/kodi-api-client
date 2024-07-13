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

struct MediaArtWork: Codable {

    var banner: String?;
    var clearart: String?;
    var clearlogo: String?;
    var discart: String?;
    var fanart: String?;
    var icon: String?;
    var keyart: String?;
    var landscape: String?;
    var poster: String?;
    var setBanner: String?;
    var setClearlogo: String?;
    var setFanart: String?;
    var setKeyart: String?;
    var setLandscape: String?;
    var setPoster: String?;
    enum CodingKeys: String, CodingKey {
        case banner;
        case clearart;
        case clearlogo;
        case discart;
        case fanart;
        case icon;
        case keyart;
        case landscape;
        case poster;
        case setBanner = "set.banner";
        case setClearlogo = "set.clearlogo";
        case setFanart = "set.fanart";
        case setKeyart = "set.keyart";
        case setLandscape = "set.landscape";
        case setPoster = "set.poster";
    }
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

struct Movie: Codable {
    var art: MediaArtWork?;
    var cast: [VideoCast]?;
    var country: [String]?;
    // var dateadded: Date;
    var dateadded: String?;
    var director: [String]?;
    var fanart: String?;
    var file: String?;
    var genre: [String]?;
    var imdbnumber: String?;
    var label: String?;
    var lastplayed: String?;
    var movieid: Int?;
    var mpaa: String?;
    var originaltitle: String?;
    var playcount: Int?;
    var plot: String?;
    var plotoutline: String?;
    var premiered: String?;
    var rating: Double?;
    var resume: VideoResume?;
    var runtime: Int?;
    var set: String?;
    var setid: Int?;
    var showlink: String?;
    var sorttitle: String?;
    var studio: [String]?;
    var tag: [String]?;
    var tagline: String?;
    var title: String?;
    var top250: Int?;
    var trailer: String?;
    var uniqueid: String?;
    var votes: String?;
    var writer: [String]?;
    var year: Int?;
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