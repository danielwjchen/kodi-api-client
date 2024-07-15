
public struct Request<T: Codable>: Codable {
    public var jsonrpc: String = "2.0";
    public var id: Int;
    public var method: String;
    public var params: T;

    public init(
        id: Int,
        method: String,
        params: T
    ) {
        self.id = id;
        self.method = method;
        self.params = params;
    }
}