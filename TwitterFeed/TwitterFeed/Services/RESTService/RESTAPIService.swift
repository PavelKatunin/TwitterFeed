import Foundation

enum RESTError : Error {
    case unknownError
}

class RESTAPIService: RESTService {
    
    func getData(mehtod: RESTMethod,
                 url: URL,
                 headers: [String : String]?,
                 parameters: [String : String]?,
                 completion: @escaping (Result<Data>) -> Void) {
        
        //TODO: implement GET
        var request = URLRequest(url: url)
        request.httpMethod = mehtod.rawValue
        
        if let headers = headers {
            request.set(headers: headers)
        }
        
        if let parameters = parameters {
            let postParams = parameters.toHTTPParameters()
            let postData = postParams.data(using: .utf8)
            request.httpBody = postData
        }
        
        let session = URLSession.shared
        
        print(request.allHTTPHeaderFields)
        
        session.dataTask(with: request) { (data, response, error) in
            
            let result: Result<Data>
            
            if let data = data {
                result = .success(data)
            }
            else if let error = error {
                result = .failure(error)
            }
            else {
                result = .failure(RESTError.unknownError)
            }
            
            completion(result)
            
        }.resume()
        
    }
    
    
}
