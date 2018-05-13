import Foundation

class AuthOperation: RemoteOperation {
    
    //MARK: - input
    var cunsomerKey: String?
    var secret: String?
    
    //MARK: - output
    var bearerToken: String?
    
}
