import Foundation;

struct EpisodeCollectionService {
    let baseUrl: String;
    let url: URL;
    let encoder: JSONEncoder = JSONEncoder();
    let decoder: JSONDecoder = JSONDecoder();
    let method: String = "VideoLibrary.GetEpisodes";

    init(_ baseUrl: String){
        self.baseUrl = baseUrl;
        self.url = URL(string: "\(baseUrl)/jsonrpc?EpisodeCollection")!;
    }

    func getEpisodes(
        requestFilter: RequestFilter? = nil,
        requestSort: RequestSort? = nil,
        requestLimits: RequestLimits? = nil
    ) async throws -> EpisodeCollectionResponse {
        var params: EpisodeCollectionRequestParams = EpisodeCollectionRequestParams(
            properties: [
                .title,
                .thumbnail,
                .playcount,
                .lastplayed,
                .dateadded,
                .episode,
                .season,
                .rating,
                .file,
                .cast,
                .showtitle,
                .tvshowid,
                .uniqueid,
                .resume,
                .firstaired,
                .fanart
            ],
            limits: requestLimits ?? RequestLimits(),
            sort: requestSort ?? RequestSort()
        )
        if requestFilter != nil {
            params.filter = requestFilter;
        }
        let movieCollectionRequest: Request<EpisodeCollectionRequestParams> = Request<EpisodeCollectionRequestParams>(
            id: getId(),
            method: self.method,
            params: params
        );
        let httpBody: Data = try self.encoder.encode(movieCollectionRequest);
        let urlRequest: URLRequest = createUrlRequest(
            url: self.url, httpMethod: "POST", httpBody: httpBody
        );
        let (data, _) = try await URLSession.shared.data(for: urlRequest);
        let result: EpisodeCollectionResponse  = try! self.decoder.decode(
            EpisodeCollectionResponse.self, from: data
        );
        return result;
    }

    func getRecentlyAdded() async throws -> EpisodeCollectionResponse {
        let requestFilter: RequestFilter = RequestFilter(operator: "is", field: "playcount", value: "0")
        return try await self.getEpisodes(requestFilter: requestFilter);
    }

    func getRandom() async throws -> EpisodeCollectionResponse {
        let requestSort: RequestSort = RequestSort(
            method: .random, order: .descending
        );
        return try await self.getEpisodes(requestSort: requestSort);
    }

    func getContinueWatching() async throws -> EpisodeCollectionResponse {
        let requestFilter: RequestFilter = RequestFilter(operator: "true", field: "inprogress", value: "")
        return try await self.getEpisodes(requestFilter: requestFilter);
    }
}