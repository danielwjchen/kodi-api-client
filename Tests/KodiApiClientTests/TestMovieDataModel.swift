import XCTest
@testable import KodiApiClient

class MovieDataModelTests: XCTestCase {
    
    func testMovieDetailsResponseDecodingFromFile() throws {
        // Load the JSON file
        guard let url = Bundle.module.url(forResource: "movie.response", withExtension: "json") else {
            XCTFail("Missing file: movie.response.json")
            return
        }
        
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()

        // Decode the JSON data
        do {
            let response = try decoder.decode(MovieDetailsResponse.self, from: jsonData)
            XCTAssertEqual(response.result.moviedetails.label, "Apollo 13")
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
    
    func testMovieDetailsRequestEncoding() throws {
        let movieId: Int = 122;
        let MovieDetailsRequest: MovieDetailsRequest = MovieDetailsRequest(
            id: getId(), params: MovieDetailsRequestParams(
                movieid: movieId, properties: [.art,.cast,.country]
            )
        );
        let encoder: JSONEncoder = JSONEncoder()
        
        do {
            let data: Data = try encoder.encode(MovieDetailsRequest)
            if let jsonString: String = String(data: data, encoding: .utf8) {
                let movieIdString: String = "\"movieid\":\(movieId)";
                let containsMovieId: Bool = jsonString.contains(movieIdString);
                XCTAssertTrue(containsMovieId, "The request payload should contain \(movieIdString)")
            } else {
                XCTFail("Unable to convert data to string.")
            }
        } catch {
            XCTFail("Encoding failed: \(error.localizedDescription)")
        }
    }
}
