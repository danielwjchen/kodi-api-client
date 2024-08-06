
public struct VideoResume: Codable {
    public var position: Int;
    public var total: Int;

    public init(position: Int, total: Int) {
        self.position = position;
        self.total = total;
    }
}