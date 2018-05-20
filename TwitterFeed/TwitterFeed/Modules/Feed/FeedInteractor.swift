import UIKit

final class FeedInteractor: FeedInteractorProtocol, TweetsObserver {
    
    //MARK: - VIPER
    weak var presenter: FeedInteractorPresenter?
    
    let twitterService: TwitterService
    
    init(twitterService: TwitterService) {
        self.twitterService = twitterService
        self.twitterService.add(observer: self)
    }
    
    func observeTweetsFor(keyword: String) {
        self.twitterService.startTweetsObserving(forKeyword: keyword, tweetsCountLimit: 1)
    }
    
    func service(_ service: TwitterService, didReturnTweets tweets: [Tweet]) {
        presenter?.didReceive(tweets: tweets)
    }
    
    func service(_ service: TwitterService, didReturnError error: Error) {
        presenter?.didReceive(error: error)
    }
    
}
