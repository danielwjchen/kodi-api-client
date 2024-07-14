
struct Response<T: Codable>: Codable {
    var id: Int;
    var jsonrpc: String = "2.0";
    var result: T;
}