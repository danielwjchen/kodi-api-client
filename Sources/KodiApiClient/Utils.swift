import Foundation;

func getId() -> Int {
    let timestamp: Int = Int(NSDate().timeIntervalSince1970);
    return timestamp * 1000;
}

func createUrlRequest(url: URL, httpMethod: String, httpBody: Data) -> URLRequest {
    var result: URLRequest = URLRequest(url: url);
    result.httpMethod = httpMethod;
    result.httpBody = httpBody;
    result.setValue(
        "application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type"
    );
    result.setValue(
        "XMLHttpRequest", forHTTPHeaderField: "X-Requested-With"
    );
    return result;
}