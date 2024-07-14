
struct RequestSort: Codable {
    var method: Method = .none;
    var order: Order = .ascending;
    var ignorearticle: Bool = true;
    enum Order: String, Codable {
        case ascending
        case descending
    }
    enum Method: String, Codable {
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
}