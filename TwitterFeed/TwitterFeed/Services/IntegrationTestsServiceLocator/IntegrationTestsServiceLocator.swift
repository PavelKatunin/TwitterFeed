import Foundation

class IntegrationTestsServiceLocator: ServiceLocator {
    
    var httpClient: HTTPClient
    
    init() {
        twitterService = IntegrationTestsTwitterService.sharedInstance
        httpClient = RemoteHTTPClient()
    }
    
    var twitterService: TwitterService
    
}
