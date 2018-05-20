import Foundation

enum HTTPClientError: Error {
    case unknownHTTPError
}

protocol HTTPClient {
    
    func downloadData(fromUrl url: URL, completion: @escaping (Result<Data>) -> Void)
    
}
