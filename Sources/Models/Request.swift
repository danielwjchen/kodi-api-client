
protocol Request {
    var id: Int {get set};
    var jsonrpc: String {get};
    var method: String {get};
}