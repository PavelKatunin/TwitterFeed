import Foundation

enum RESTMethod {
    case POST
    case GET
}

protocol RESTService {
    
    func getData(mehtod: RESTMethod,
                 url: URL,
                 headers: [String : String]?,
                 parameters: [String : String]?,
                 completion: @escaping (Result<Data>) -> Void)
    
}
