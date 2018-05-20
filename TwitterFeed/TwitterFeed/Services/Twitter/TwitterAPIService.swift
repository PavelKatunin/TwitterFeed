import Foundation
import OhhAuth
import SwifteriOS

class TwitterAPIService: TwitterService {

    let twitterConfig: TwitterConfig    
    let swifter: Swifter
    var tweetsObservingRequest: HTTPRequest?
    // TODO: make weak, refactor observing
    var observers = [TweetsObserver]()
    
    func stopTweetsObserving() {
        tweetsObservingRequest?.stop()
    }
    
    func add(observer: TweetsObserver) {
        observers.append(observer)
    }
    
    func remove(observer: TweetsObserver) {
        //TODO: implement
    }
    
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
                                                            print(error)
                                                            
                                                            self.notifyObserversAbout(error: error)
                                                            
                                                          }
        tweetsObservingRequest?.start()
    }
    
    private func tweetsJsonReceived(_ json: JSON) {
        let tweets = createTweetsFrom(json: json)
        notifyObserversAbout(tweets: tweets)
    }
    
    private func createTweetsFrom(json: JSON) -> [Tweet] {
        print(json.description)
        
        var tweets = [Tweet]()
        
        if let jsonData = json.description.data(using: .utf8) {
            do {
                let tweet = try JSONDecoder().decode(Tweet.self, from: jsonData)
                tweets.append(tweet)
            }
            catch {
                print(error)
            }
        }

        return tweets
    }
    
    private func notifyObserversAbout(tweets: [Tweet]) {
        observers.forEach { (observer) in
            observer.service(self, didReturnTweets: tweets)
        }
    }
    
    private func notifyObserversAbout(error: Error) {
        observers.forEach { (observer) in
            observer.service(self, didReturnError: error)
        }
    }
    
}
