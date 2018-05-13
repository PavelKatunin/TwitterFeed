import Foundation

class TwitterAPIService: TwitterService {
    
    let restService: RESTService
    
    init(restService: RESTService) {
        self.restService = restService
    }
    
    func getTwits(keyword: String, completion: @escaping () -> Void) {
        
    }
    
    func startTwitsObserving(forKeyword keyword: String, twitsCountLimit: Int) {
        
    }
    
    func add(observer: TwitsObserver) {
        
    }
    
    func remove(observer: TwitsObserver) {
        
    }
    
    func loadTwitsOperation() -> LoadTwitsOperation {
        return LoadTwitsOperation()
    }
    
}
