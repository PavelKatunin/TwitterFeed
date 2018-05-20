import Foundation


class Services: ServiceLocator {
    
    var twitterService: TwitterService
    var httpClient: HTTPClient
    
    static private(set) var sharedInstance: ServiceLocator = Services()
    
    init() {
        twitterService = TwitterAPIService(twitterConfig: PKTwitterConfig())
        httpClient = RemoteHTTPClient()
        
        #if DEBUG
        if let _ = NSClassFromString("XCTest") {
            twitterService = IntegrationTestsTwitterService.sharedInstance
            httpClient = IntegrationTestsHTTPClient()
        }
        #endif
    }
    
    static func inject(serviceLocator: ServiceLocator) {
        Services.sharedInstance = serviceLocator
    }
    
}
