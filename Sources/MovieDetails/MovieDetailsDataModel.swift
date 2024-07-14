//
//  MovieDataModel.swift
//
//  Created by Daniel Chen on 7/4/24.
//
struct MovieDetailsRequestParams: Codable {
    var movieid: Int;
    var properties: [MovieFields];
}

struct MovieDetailsResponseResult: Codable {
    var moviedetails: Movie;
}

struct MovieDetailsResponse: Codable {
    var id: Int;
    var jsonrpc: String = "2.0";
    var result: MovieDetailsResponseResult;
}