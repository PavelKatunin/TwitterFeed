import Foundation

class RemoteHTTPClient: HTTPClient {
    
    func downloadData(fromUrl url: URL, completion: @escaping (Result<Data>) -> Void) {
        URLSession.shared.downloadTask(with: url) { (savedFileUrl, response, error) in
            
            var result: Result<Data>
            
            if let error = error {
                result = .failure(error)
            }
            else if let savedFileUrl = savedFileUrl {
                do {
                    let data = try Data(contentsOf: savedFileUrl)
                    result = .success(data)
                }
                catch {
                    print(error)
                    result = .failure(error)
                }
            }
            else {
                result = .failure(HTTPClientError.unknownHTTPError)
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }.resume()
    }
    
}
