public struct StreamDetailsAudio: Codable {
    public var channels: Int?;
    public var codec: String?;
    public var language: String?;
}

public struct StreamDetailsSubtitle: Codable {
    public var language: String;
}

public struct StreamDetailsVideo: Codable {
    public var aspect: Double?;
    public var codec: String?;
    public var duration: Int?;
    public var hdrtype: String?;
    public var height: Int?;
    public var language: String?;
    public var stereomode: String?;
    public var width: Int?;
}

public struct StreamDetails: Codable {
    public var audio: [StreamDetailsAudio]?;
    public var subtitle: [StreamDetailsSubtitle]?;
    public var video: [StreamDetailsVideo]?;
}