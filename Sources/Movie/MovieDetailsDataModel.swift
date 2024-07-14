struct MovieDetailsRequestParams: Codable {
    var movieid: Int;
    var properties: [MovieFields];
}

struct MovieDetailsResponseResult: Codable {
    var moviedetails: Movie;
}