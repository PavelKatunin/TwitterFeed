import Foundation

struct User: Codable {
    
    //MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url_https"
        case screenName = "screen_name"
    }
    
    var profileImageUrl: URL?
    var screenName: String?
    
}
