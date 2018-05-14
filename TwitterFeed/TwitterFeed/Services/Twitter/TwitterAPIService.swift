import Foundation

class TwitterAPIService: TwitterService {

    let restService: RESTService
    
    init(restService: RESTService) {
        self.restService = restService
    }
    
    func getTweets(keyword: String, completion: @escaping () -> Void) {
        
    }
    
    func startTweetsObserving(forKeyword keyword: String, tweetsCountLimit: Int) {
        
    }
    
    func add(observer: TweetsObserver) {
        
    }
    
    func remove(observer: TweetsObserver) {
        
    }
    
}
