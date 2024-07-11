import XCTest
@testable import KodiApiClient

class CodableTests: XCTestCase {
    
    func testMovieCollectionResponseDecodingFromFile() throws {
        // Load the JSON file
        guard let url = Bundle.module.url(forResource: "movies.recently-added.response", withExtension: "json") else {
            XCTFail("Missing file: api-schema.json")
            return
        }
        
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()

        // Decode the JSON data
        do {
            let response = try decoder.decode(KodiApiClient.MovieCollectionResponse.self, from: jsonData)
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
    
    // func testPersonEncoding() throws {
    //     let person = KodiApiClient.MovieCollectionResponse(name: "John Doe", age: 30)
    //     let encoder = JSONEncoder()
    //     encoder.outputFormatting = .prettyPrinted
        
    //     do {
    //         let data = try encoder.encode(person)
    //         let jsonString = String(data: data, encoding: .utf8)
    //         XCTAssertNotNil(jsonString)
    //         print(jsonString!) // Optional: to see the JSON string in the console
    //     } catch {
    //         XCTFail("Encoding failed: \(error.localizedDescription)")
    //     }
    // }
}
