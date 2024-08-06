public struct StreamDetailsAudio: Codable {
    public var channels: Int?;
    public var codec: String?;
    public var language: String?;

    public init(channels: Int, codec: String, language: String) {
        self.channels = channels;
        self.codec = codec;
        self.language = language;
    }
}

public struct StreamDetailsSubtitle: Codable {
    public var language: String;

    public init(language: String) {
        self.language = language;
    }
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

    public init(
        aspect: Double, 
        codec: String,
        duration: Int,
        hdrtype: String,
        height: Int,
        language: String,
        stereomode: String,
        width: Int
    ) {
        self.aspect = aspect;
        self.codec = codec;
        self.duration = duration;
        self.hdrtype = hdrtype;
        self.height = height;
        self.language = language;
        self.stereomode = stereomode;
        self.width = width;
    }
}

public struct StreamDetails: Codable {
    public var audio: [StreamDetailsAudio]?;
    public var subtitle: [StreamDetailsSubtitle]?;
    public var video: [StreamDetailsVideo]?;

    public init(
        audio: [StreamDetailsAudio],
        subtitle: [StreamDetailsSubtitle],
        video: [StreamDetailsVideo]
    ) {
        self.audio = audio;
        self.subtitle = subtitle;
        self.video = video;
    }
}