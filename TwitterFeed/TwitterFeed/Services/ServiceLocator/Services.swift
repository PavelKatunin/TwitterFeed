import Foundation


class Services: ServiceLocator {
    
    var restService: RESTService
    var twitterService: TwitterService
    var endpointService: EndpointService
    
    var sharedInstance: Services = Services()
    
    init() {
        restService = RESTAPIService()
        twitterService = TwitterAPIService()
        endpointService = ProductionEndpointService()
    }
    
}
