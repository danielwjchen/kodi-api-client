import Foundation

struct GenericCollectionService<PropertiesType: Codable, ResultType: Codable> {

    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();
    let rpcMethod: String;
    let properties: [PropertiesType];

    init(
        _ baseUrl: String, rpcMethod: String, query: String, 
        properties: [PropertiesType]
    ){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?\(query)")!;
        self.rpcMethod = rpcMethod;
        self.properties = properties;
    }

    func getCollection(
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

    func getRecentlyAdded() async throws -> Response<ResultType> {
        let requestFilter: RequestFilter = RequestFilter(operator: "is", field: "playcount", value: "0")
        return try await self.getCollection(requestFilter: requestFilter);
    }

    func getRandom() async throws -> Response<ResultType> {
        let requestSort: RequestSort = RequestSort(
            method: .random, order: .descending
        );
        return try await self.getCollection(requestSort: requestSort);
    }

    func getContinueWatching() async throws -> Response<ResultType> {
        let requestFilter: RequestFilter = RequestFilter(operator: "true", field: "inprogress", value: "")
        return try await self.getCollection(requestFilter: requestFilter);
    }



}