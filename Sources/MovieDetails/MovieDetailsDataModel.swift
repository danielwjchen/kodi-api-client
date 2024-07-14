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