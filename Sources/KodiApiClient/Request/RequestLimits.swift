
public struct RequestLimits: Codable {
    public var start: Int = 0;
    public var end: Int?;

    public init() {
        self.start = 0;
    }

    public init(start: Int, end: Int?) {
        self.start = start;
        self.end = end;
    }
}