import Foundation

struct Tweet: Codable {
    
    //MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case timeStampString = "timestamp_ms"
        case fullText = "full_text"
        case user = "user"
    }
    
    var text: String
    var fullText: String?
    var timeStampString: String
    var user: User?
    
}
