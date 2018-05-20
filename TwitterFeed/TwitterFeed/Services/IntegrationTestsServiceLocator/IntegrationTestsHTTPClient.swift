import Foundation

class IntegrationTestsHTTPClient: HTTPClient {
    
    func downloadData(fromUrl url: URL, completion: @escaping (Result<Data>) -> Void) {
        
        let bundle = Bundle.main
        var path: String?

        if url.absoluteString == "https://dogo.com/dogo.png" {
            path = bundle.path(forResource: "dogo", ofType: "jpeg")
        } else if url.absoluteString == "https://dogo.com/artdogo.png" {
            path = bundle.path(forResource: "artDogo", ofType: "jpg")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        catch {
            
        }
    }
    
}
