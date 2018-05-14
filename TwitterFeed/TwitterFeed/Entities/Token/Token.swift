import Foundation

struct Token: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
    }
    
    let tokenType: String
    let accessToken: String
    
}
