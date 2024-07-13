struct MediaArtWork: Codable {

    var banner: String?;
    var clearart: String?;
    var clearlogo: String?;
    var discart: String?;
    var fanart: String?;
    var icon: String?;
    var keyart: String?;
    var landscape: String?;
    var poster: String?;
    var setBanner: String?;
    var setClearlogo: String?;
    var setFanart: String?;
    var setKeyart: String?;
    var setLandscape: String?;
    var setPoster: String?;
    enum CodingKeys: String, CodingKey {
        case banner;
        case clearart;
        case clearlogo;
        case discart;
        case fanart;
        case icon;
        case keyart;
        case landscape;
        case poster;
        case setBanner = "set.banner";
        case setClearlogo = "set.clearlogo";
        case setFanart = "set.fanart";
        case setKeyart = "set.keyart";
        case setLandscape = "set.landscape";
        case setPoster = "set.poster";
    }
}