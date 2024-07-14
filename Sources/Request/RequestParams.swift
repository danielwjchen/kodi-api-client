
struct RequestParams<T: Codable>: Codable {
    var properties: [T];
    var limits: RequestLimits;
    var sort: RequestSort;
    var filter: RequestFilter?;
}