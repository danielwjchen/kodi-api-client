import Foundation

public struct GenericCollectionService<PropertiesType: Codable, ResultType: Codable> {

    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();
    let rpcMethod: String;
    let properties: [PropertiesType];

    public init(
        _ baseUrl: String, rpcMethod: String, query: String, 
        properties: [PropertiesType]
    ){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?\(query)")!;
        self.rpcMethod = rpcMethod;
        self.properties = properties;
    }

    public func getCollection(
        requestFilter: RequestFilter? = nil,
        requestSort: RequestSort? = nil,
        requestLimits: RequestLimits? = nil
    ) async throws -> Response<ResultType> {
        typealias RequestParamsType = RequestParams<PropertiesType>;
        var params: RequestParamsType = RequestParamsType(
            properties: self.properties,
            limits: requestLimits ?? RequestLimits(),
            sort: requestSort ?? RequestSort()
        )
        if requestFilter != nil {
            params.filter = requestFilter;
        }
        typealias RequestType = Request<RequestParamsType>;
        let movieCollectionRequest: RequestType = RequestType(
            id: getId(),
            method: self.rpcMethod,
            params: params
        );
        let httpBody: Data = try self.encoder.encode(movieCollectionRequest);
        let urlRequest: URLRequest = createUrlRequest(
            url: self.url, httpMethod: "POST", httpBody: httpBody
        );
        let (data, _) = try await URLSession.shared.data(for: urlRequest);
        typealias ResponseType = Response<ResultType>;
        let result: ResponseType  = try! self.decoder.decode(
            ResponseType.self, from: data
        );
        return result;
    }

    public func getRecentlyAdded(limit: Int? = nil) async throws -> Response<ResultType> {
        let requestFilter: RequestFilter = RequestFilter(operator: "is", field: "playcount", value: "0")
        if let limit = limit {
            return try await self.getCollection(
                requestFilter: requestFilter,
                requestLimits: RequestLimits(
                    start: 0,
                    end: limit
                )
            );
        } else {
            return try await self.getCollection(requestFilter: requestFilter);
        }
    }

    public func getRandom(limit: Int? = nil) async throws -> Response<ResultType> {
        let requestSort: RequestSort = RequestSort(
            method: .random, order: .descending
        );
        if let limit = limit {
            return try await self.getCollection(
                requestSort: requestSort,
                requestLimits: RequestLimits(
                    start: 0,
                    end: limit
                )
            );
        } else {
            return try await self.getCollection(requestSort: requestSort);
        }
    }

    public func getInProgress(limit: Int? = nil) async throws -> Response<ResultType> {
        let requestFilter: RequestFilter = RequestFilter(operator: "true", field: "inprogress", value: "")
        if let limit = limit {
            return try await self.getCollection(
                requestFilter: requestFilter,
                requestLimits: RequestLimits(
                    start: 0,
                    end: limit
                )
            );
        } else {
            return try await self.getCollection(requestFilter: requestFilter);
        }
    }

}