
public struct RequestSort: Codable {
    public var method: Method = .none;
    public var order: Order = .ascending;
    public var ignorearticle: Bool = true;
    public enum Order: String, Codable {
        case ascending
        case descending
    }
    public enum Method: String, Codable {
        case none
        case label
        case date
        case size
        case file
        case path
        case drivetype
        case title
        case track
        case time
        case artist
        case album
        case albumtype
        case genre
        case country
        case year
        case rating
        case userrating
        case votes
        case top250
        case programcount
        case playlist
        case episode
        case season
        case totalepisodes
        case watchedepisodes
        case tvshowstatus
        case tvshowtitle
        case sorttitle
        case productioncode
        case mpaa
        case studio
        case dateadded
        case lastplayed
        case playcount
        case listeners
        case bitrate
        case random
        case totaldiscs
        case originaldate
        case bpm
        case originaltitle
    }

    public init() {}

    public init(
        method: Method = .none,
        order: Order = .ascending,
        ignorearticle: Bool = true
    ) {
        self.method = method;
        self.order = order;
        self.ignorearticle = ignorearticle;
    }
}