
public struct Episode: Codable {
    public var art: MediaArtWork?;
    public var cast: [VideoCast]?;
    public var dateadded: String?;
    // public var dateadded: Date;
    public var director: [String]?;
    public var episode: Int?;
    public var episodeid: Int?;
    public var file: String?;
    public var firstaired: String?;
    public var genre: [String]?;
    public var lastplayed: String?;
    public var originaltitle: String?;
    public var plot: String?;
    public var productioncode: String?;
    public var playcount: Int?;
    public var rating: Double?;
    // public var ratings: Any?;
    public var resume: VideoResume?;
    public var runtime: Int?;
    public var season: Int?;
    public var seasonid: Int?;
    public var showtitle: String?;
    public var specialsortepisode: Int?;
    public var specialsortseason: Int?;
    public var streamdetails: StreamDetails?;
    public var studio: [String]?;
    public var title: String?;
    public var tvshowid: Int?;
    public var uniqueid: UniqueIDSet?;
    public var userrating: Int?;
    public var votes: String?;
    public var writer: [String]?;
}