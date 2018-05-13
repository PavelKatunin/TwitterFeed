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
    func viewLoaded() {
        view?.title = "Feed"
    }
}

extension FeedPresenter: FeedInteractorPresenter {
    
}

extension FeedPresenter: FeedIO {
    
}
