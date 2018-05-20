import Foundation

protocol ServiceLocator {

    var twitterService: TwitterService { get }
    var httpClient: HTTPClient { get }
    
}
