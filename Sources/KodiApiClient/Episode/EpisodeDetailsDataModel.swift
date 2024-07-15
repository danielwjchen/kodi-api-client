public struct EpisodeDetailsRequestParams: Codable {
    public var episodeid: Int;
    public var properties: [EpisodeFields];
}

public struct EpisodeDetailsResponseResult: Codable {
    public var episodedetails: Episode;
}