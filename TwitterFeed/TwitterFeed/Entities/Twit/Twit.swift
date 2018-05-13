import Foundation

enum MediaContent {
    case image
    case video
    case link
}

struct Twit {
    var text: String
    var media: MediaContent
    var timeStamp: Date
    var userName: String
}
