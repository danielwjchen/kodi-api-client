
struct RequestParams: Codable {
    var properties: [VideoFieldsMovie];
    var limits: RequestLimits;
    var sort: RequestSort;
    var filter: RequestFilter?;
}