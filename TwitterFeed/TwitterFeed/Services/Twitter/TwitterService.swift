import Foundation

protocol TwitsObserver {
    
    func service(_ service: TwitterService, didReturnTwits twits: [Twit])
    
}

protocol TwitterService {
    func getTwits(keyword: String, completion: @escaping () -> Void)
    func loadTwitsOperation() -> LoadTwitsOperation
    func startTwitsObserving(forKeyword keyword: String, twitsCountLimit: Int)
    func add(observer: TwitsObserver)
    func remove(observer: TwitsObserver)
}
