
protocol RequestParams: Codable {
    var limits: RequestLimits {get set}
    var sort: RequestSort {get set}
    var filter: RequestFilter? {get set}
}