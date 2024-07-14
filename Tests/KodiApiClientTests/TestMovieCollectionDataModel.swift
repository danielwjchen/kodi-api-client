import XCTest
@testable import KodiApiClient

class MovieCollectionDataModelTests: XCTestCase {
    
    func testMovieCollectionResponseDecodingFromFile() throws {
        // Load the JSON file
        guard let url = Bundle.module.url(forResource: "movies.recently-added.response", withExtension: "json") else {
            XCTFail("Missing file: movies.recently-added.json")
            return
        }
        
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()

        // Decode the JSON data
        do {
            let response = try decoder.decode(MovieCollectionResponse.self, from: jsonData)
            XCTAssertEqual(response.result.movies.count, 14)
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
    
    func testMovieCollectionRequestEncoding() throws {
        let method: String = "VideoLibrary.GetMovies";
        let movieCollectionRequest: Request<MovieCollectionRequestParams> = Request<MovieCollectionRequestParams>(
                id: getId(),
                method: method,
                params: MovieCollectionRequestParams(
                    properties: [
                        .title,
                        .art,
                        .playcount,
                        .lastplayed,
                        .dateadded,
                        .resume,
                        .rating,
                        .year,
                        .file,
                        .genre,
                        .writer,
                        .director,
                        .cast,
                        .set,
                        .studio,
                        .mpaa,
                        .tag,
                        .fanart
                    ],
                    limits: RequestLimits(),
                    sort: RequestSort(),
                    filter: RequestFilter(operator: "is", field: "playcount", value: "0")
                )
            );
            let encoder: JSONEncoder = JSONEncoder()
            
            do {
                let data: Data = try encoder.encode(movieCollectionRequest)
                if let jsonString: String = String(data: data, encoding: .utf8) {
                    let methodString: String = "\"method\":\"\(method)\"";
                    let containsMethod: Bool = jsonString.contains(methodString);
                    XCTAssertTrue(containsMethod, methodString);
                } else {
                    XCTFail("Unable to convert data to string.")
                }
            } catch {
                XCTFail("Encoding failed: \(error.localizedDescription)")
            }
    }
}
