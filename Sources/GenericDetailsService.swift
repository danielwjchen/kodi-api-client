import Foundation;

struct GenericDetailsService<ParamsType: Codable, ResultType: Codable> {
    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();
    let rpcMethod: String;

    init(_ baseUrl: String, rpcMethod: String, query: String){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?\(query)")!;
        self.rpcMethod = rpcMethod;
    }

    func getDetails(
        _ params: ParamsType
    ) async throws -> Response<ResultType> {
        let movieDetailsRequest: Request<ParamsType> = Request<ParamsType>(
            id: getId(),
            method: self.rpcMethod,
            params: params
        );
        let httpBody: Data = try self.encoder.encode(movieDetailsRequest);
        let urlRequest: URLRequest = createUrlRequest(
            url: self.url, httpMethod: "POST", httpBody: httpBody
        );
        let (data, _) = try await URLSession.shared.data(for: urlRequest);
        let result: Response<ResultType>  = try! self.decoder.decode(
            Response<ResultType>.self, from: data
        );
        return result;
    }
}