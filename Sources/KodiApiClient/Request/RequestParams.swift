
public struct RequestParams<T: Codable>: Codable {
    public var properties: [T];
    public var limits: RequestLimits;
    public var sort: RequestSort;
    public var filter: RequestFilter? = nil;

    public init(
        properties: [T], limits: RequestLimits, sort: RequestSort,
        filter: RequestFilter? = nil
    ) {
        self.properties = properties;
        self.limits = limits;
        self.sort = sort;
        self.filter = filter;
    }
}