
enum VideoFieldsMovie: String, Codable {
    case title
    case genre
    case year
    case rating
    case director
    case trailer
    case tagline
    case plot
    case plotoutline
    case originaltitle
    case lastplayed
    case playcount
    case writer
    case studio
    case mpaa
    case cast
    case country
    case imdbnumber
    case runtime
    case set
    case showlink
    case streamdetails
    case top250
    case votes
    case fanart
    case thumbnail
    case file
    case sorttitle
    case resume
    case setid
    case dateadded
    case tag
    case art
    case userrating
    case ratings
    case premiered
    case uniquei
}


struct RequestLimits: Codable {
    var start: Int;
    var end: Int;
}

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
        case originaltitl

    }
}

protocol Request {
    var id: Int {get set};
    var jsonrpc: String {get};
    var method: String {get};
    var params: RequestParams {get};
}

struct ResponseLimits: Codable {
    var end: Int?;
    var start: Int?;
    var total: Int?;
}