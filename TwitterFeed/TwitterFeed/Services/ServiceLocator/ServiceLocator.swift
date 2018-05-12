import Foundation

protocol ServiceLocator {
    
    var restService: RESTService { get }
    var twitterService: TwitterService { get }
    var endpointService: EndpointService { get }
    
}
