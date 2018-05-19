import Foundation


class Services: ServiceLocator {
    
    var twitterService: TwitterService
    
    static private(set) var sharedInstance: ServiceLocator = Services()
    
    init() {
        
        twitterService = TwitterAPIService(twitterConfig: PKTwitterConfig())
        
    }
    
    static func inject(serviceLocator: ServiceLocator) {
        Services.sharedInstance = serviceLocator
    }
    
}
