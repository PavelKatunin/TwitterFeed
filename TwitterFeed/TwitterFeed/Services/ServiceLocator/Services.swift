import Foundation


class Services: ServiceLocator {
    
    var restService: RESTService
    var twitterService: TwitterService
    var endpointService: EndpointService
    
    static private(set) var sharedInstance: ServiceLocator = Services()
    
    init() {
        restService = RESTAPIService()
        twitterService = TwitterAPIService(restService: restService)
        endpointService = ProductionEndpointService()
    }
    
    static func inject(serviceLocator: ServiceLocator) {
        Services.sharedInstance = serviceLocator
    }
    
}
