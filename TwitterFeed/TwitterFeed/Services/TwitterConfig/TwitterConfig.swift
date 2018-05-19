import Foundation

protocol TwitterConfig {
    
    var consumerKey: String { get }
    var consumerSecretKey: String { get }
    var userAccessToken: String { get }
    var userAccessTokenSecret: String { get }
    
}
