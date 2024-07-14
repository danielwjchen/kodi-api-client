struct EpisodeDetailsRequestParams: Codable {
    var episodeid: Int;
    var properties: [EpisodeFields];
}

struct EpisodeDetailsResponseResult: Codable {
    var episodedetails: Episode;
}