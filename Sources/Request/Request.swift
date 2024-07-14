
struct Request<T: Codable>: Codable {
    var jsonrpc: String = "2.0";
    var id: Int;
    var method: String;
    var params: T;
}