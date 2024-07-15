public struct MovieDetailsRequestParams: Codable {
    public var movieid: Int;
    public var properties: [MovieFields];
}

public struct MovieDetailsResponseResult: Codable {
    public var moviedetails: Movie;
}