struct StreamDetailsAudio: Codable {
    var channels: Int?;
    var codec: String?;
    var language: String?;
}

struct StreamDetailsSubtitle: Codable {
    var language: String;
}

struct StreamDetailsVideo: Codable {
    var aspect: Double?;
    var codec: String?;
    var duration: Int?;
    var hdrtype: String?;
    var height: Int?;
    var language: String?;
    var stereomode: String?;
    var width: Int?;
}

struct StreamDetails: Codable {
    var audio: [StreamDetailsAudio]?;
    var subtitle: [StreamDetailsSubtitle]?;
    var video: [StreamDetailsVideo]?;
}