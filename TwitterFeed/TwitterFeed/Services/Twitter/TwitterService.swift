import Foundation

protocol TweetsObserver {
    func service(_ service: TwitterService, didReturnTwits tweets: [Tweet])
}

protocol TwitterService {
    func getTweets(keyword: String, completion: @escaping () -> Void)
    func startTweetsObserving(forKeyword keyword: String, tweetsCountLimit: Int)
    func add(observer: TweetsObserver)
    func remove(observer: TweetsObserver)
}
