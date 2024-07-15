
public struct Response<T: Codable>: Codable {
    public var id: Int;
    public var jsonrpc: String = "2.0";
    public var result: T;
}