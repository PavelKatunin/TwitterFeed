import Foundation

struct Tweet: Codable {
    
    var text: String
    var fullText: String
    var timeStamp: Date?
    var user: User?
    
}
