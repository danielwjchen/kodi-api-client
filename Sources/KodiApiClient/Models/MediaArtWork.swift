public struct MediaArtWork: Codable {

    public var banner: String?;
    public var clearart: String?;
    public var clearlogo: String?;
    public var discart: String?;
    public var fanart: String?;
    public var icon: String?;
    public var keyart: String?;
    public var landscape: String?;
    public var poster: String?;
    public var setBanner: String?;
    public var setClearlogo: String?;
    public var setFanart: String?;
    public var setKeyart: String?;
    public var setLandscape: String?;
    public var setPoster: String?;
    public enum CodingKeys: String, CodingKey {
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