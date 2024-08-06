
public struct VideoCast: Codable {
    public var name: String;
    public var order: Int;
    public var role: String;
    public var thumbnail: String?;

    public init(name: String, order: Int, role: String, thumbnail: String) {
        self.name = name;
        self.order = order;
        self.role = role;
        self.thumbnail = thumbnail;
    }
}