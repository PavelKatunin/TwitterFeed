import Foundation
import OhhAuth
import SwifteriOS

class TwitterAPIService: TwitterService {

    let twitterConfig: TwitterConfig    
    let swifter: Swifter
    var tweetsObservingRequest: HTTPRequest?
    
    init(twitterConfig: TwitterConfig) {
        self.twitterConfig = twitterConfig
        swifter = Swifter(consumerKey: twitterConfig.consumerKey,
                          consumerSecret: twitterConfig.consumerSecretKey,
                          oauthToken: twitterConfig.userAccessToken,
                          oauthTokenSecret: twitterConfig.userAccessTokenSecret)
    }
    
    func startTweetsObserving(forKeyword keyword: String, tweetsCountLimit: Int) {
        tweetsObservingRequest?.stop()
        tweetsObservingRequest = swifter.postTweetFilters(track: [keyword],
                                                          progress: { (json) in
                                                
                                                            self.tweetsJsonReceived(json)
                                                
                                                         },
                                                          stallWarningHandler: nil)
                                                          { (error) in
                                                            //TODO: handle error
                                                          }
        tweetsObservingRequest?.start()
    }
    
    func tweetsJsonReceived(_ json: JSON) {
        let tweets = createTweetsFrom(json: json)
        notifyObserversAbout(tweets: tweets)
    }
    
    func createTweetsFrom(json: JSON) -> [Tweet] {
        print(json.description)
        
        return [Tweet]()
    }
    
    func notifyObserversAbout(tweets: [Tweet]) {
        
    }
    
    func stopTweetsObserving() {
        tweetsObservingRequest?.stop()
    }
    
    func add(observer: TweetsObserver) {
        
    }
    
    func remove(observer: TweetsObserver) {
        
    }
    
}
