import UIKit

final class FeedPresenter {

    fileprivate weak var view: FeedViewProtocol!
    fileprivate let interactor: FeedInteractorProtocol
    fileprivate let router: FeedWireframeProtocol
    
    weak var output: FeedOutput?

    init(view: FeedViewProtocol, interactor: FeedInteractorProtocol, router: FeedWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FeedPresenter: FeedViewPresenter {
    
    func didEnter(keyword: String) {
        interactor.observeTweetsFor(keyword: keyword)
        view?.resetTweets()
    }
    
    func viewLoaded() {
        view?.title = "Feed"
    }
    
}

extension FeedPresenter: FeedInteractorPresenter {
    
    func didReceive(tweets: [Tweet]) {
        view.add(tweets: tweets)
    }
    
    func didReceive(error: Error) {
        view.showError(text: error.localizedDescription)
    }
    
}

extension FeedPresenter: FeedIO {
    
}
