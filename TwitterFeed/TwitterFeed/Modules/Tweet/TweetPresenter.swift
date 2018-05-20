import UIKit

final class TweetPresenter {

    fileprivate weak var view: TweetViewProtocol!
    fileprivate let interactor: TweetInteractorProtocol
    fileprivate let router: TweetWireframeProtocol
    
    weak var output: TweetOutput?
    
    var inputTweet: Tweet? {
        didSet {
            view.tweet = tweet
            refreshUserImage()
        }
    }

    init(view: TweetViewProtocol, interactor: TweetInteractorProtocol, router: TweetWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func refreshUserImage() {
        if let imageUrlString = view.tweet?.user?.profileImageUrl,
            let imageUrl = URL(string: imageUrlString) {
            interactor.downloadUserImage(url: imageUrl)
        }
    }
}

extension TweetPresenter: TweetViewPresenter {
    func viewLoaded() {
        view?.title = "Tweet"
        view.tweet = inputTweet
        refreshUserImage()
    }
    
    func tweetSetUp() {
        refreshUserImage()
    }
}

extension TweetPresenter: TweetInteractorPresenter {
    
    func didDownload(userImage: UIImage) {
        view.userImage = userImage
    }
    
}

extension TweetPresenter: TweetIO {
    
    var tweet: Tweet? {
        set {
            inputTweet = newValue
        }
        get {
            return inputTweet
        }
    }
    
    
}
