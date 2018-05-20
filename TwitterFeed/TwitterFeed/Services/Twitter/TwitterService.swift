import Foundation

protocol TweetsObserver {
    
    func service(_ service: TwitterService, didReturnTweets tweets: [Tweet])
    func service(_ service: TwitterService, didReturnError error: Error)
    
}

protocol TwitterService {
    
    func startTweetsObserving(forKeyword keyword: String, tweetsCountLimit: Int)
    func stopTweetsObserving()
    func add(observer: TweetsObserver)
    func remove(observer: TweetsObserver)
    
}
