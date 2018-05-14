import Foundation

enum RESTMethod: String {
    case POST = "POST"
    case GET = "GET"
}

protocol RESTService {
    
    func getData(mehtod: RESTMethod,
                 url: URL,
                 headers: [String : String]?,
                 parameters: [String : String]?,
                 completion: @escaping (Result<Data>) -> Void)
    
}
