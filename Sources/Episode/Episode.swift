
struct Episode: Codable {
    var art: MediaArtWork?;
    var cast: [VideoCast]?;
    var dateadded: String?;
    // var dateadded: Date;
    var director: [String]?;
    var episode: Int?;
    var episodeid: Int?;
    var file: String?;
    var firstaired: String?;
    var genre: [String]?;
    var lastplayed: String?;
    var originaltitle: String?;
    var plot: String?;
    var productioncode: String?;
    var playcount: Int?;
    var rating: Double?;
    // var ratings: Any?;
    var resume: VideoResume?;
    var runtime: Int?;
    var season: Int?;
    var seasonid: Int?;
    var showtitle: String?;
    var specialsortepisode: Int?;
    var specialsortseason: Int?;
    var streamdetails: StreamDetails?;
    var studio: [String]?;
    var title: String?;
    var tvshowid: Int?;
    var uniqueid: UniqueIDSet?;
    var userrating: Int?;
    var votes: String?;
    var writer: [String]?;
}