import XCTest
@testable import KodiApiClient

class EpisodeCollectionDataModelTests: XCTestCase {
    
    func testEpisodeCollectionResponseDecodingFromFile() throws {
        // Load the JSON file
        guard let url = Bundle.module.url(forResource: "episodes.recently-added.response", withExtension: "json") else {
            XCTFail("Missing file: episodes.recently-added.json")
            return
        }
        
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()

        // Decode the JSON data
        do {
            let response = try decoder.decode(EpisodeCollectionResponse.self, from: jsonData)
            XCTAssertEqual(response.result.episodes.count, 12);
        } catch let error as DecodingError{
            switch error {
                case .typeMismatch(let key, let value):
                    print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                case .valueNotFound(let key, let value):
                    print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                case .keyNotFound(let key, let value):
                    print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                case .dataCorrupted(let key):
                    print("error \(key), and ERROR: \(error.localizedDescription)")
                default:
                    print("ERROR: \(error.localizedDescription)")
            }
            XCTFail("Decoding failed: \(error.localizedDescription)")
        }
    }
    
    func testEpisodeCollectionRequestEncoding() throws {
        let method: String = "VideoLibrary.GetEpisodes";
        let episodeCollectionRequest: Request<EpisodeCollectionRequestParams> = Request<EpisodeCollectionRequestParams>(
                id: getId(),
                method: method,
                params: EpisodeCollectionRequestParams(
                    properties: [
                        .title,
                        .art,
                        .playcount,
                        .lastplayed,
                        .dateadded,
                        .resume,
                        .rating,
                        .file,
                        .genre,
                        .writer,
                        .director,
                        .cast,
                        .studio,
                        .fanart
                    ],
                    limits: RequestLimits(),
                    sort: RequestSort(),
                    filter: RequestFilter(operator: "is", field: "playcount", value: "0")
                )
            );
            let encoder: JSONEncoder = JSONEncoder()
            
            do {
                let data: Data = try encoder.encode(episodeCollectionRequest)
                if let jsonString: String = String(data: data, encoding: .utf8) {
                    let methodString: String = "\"method\":\"\(method)\"";
                    let containsMethod: Bool = jsonString.contains(methodString);
                    XCTAssertTrue(containsMethod, methodString);
                    let propertiesString: String = episodeCollectionRequest.params.properties.map {
                        "\"\($0.rawValue)\""
                    }.joined(separator: ",");
                    let containsProperties: Bool = jsonString.contains(propertiesString);
                    XCTAssertTrue(containsProperties, propertiesString);
                } else {
                    XCTFail("Unable to convert data to string.")
                }
            } catch {
                XCTFail("Encoding failed: \(error.localizedDescription)")
            }
    }
}
