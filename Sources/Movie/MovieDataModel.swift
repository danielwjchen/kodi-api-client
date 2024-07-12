//
//  MovieDataModel.swift
//
//  Created by Daniel Chen on 7/4/24.
//
struct MovieRequestParams: Codable {
    var movieid: Int;
    var properties: [VideoFieldsMovie];
}

struct MovieRequest: Codable {
    var jsonrpc: String = "2.0";
    var id: Int;
    var method: String = "VideoLibrary.GetMovieDetails";
    var params: MovieRequestParams
}


struct MovieResponseResult: Codable {
    var moviedetails: Movie;
}

struct MovieResponse: Codable {
    var id: Int;
    var jsonrpc: String = "2.0";
    var result: MovieResponseResult;
}