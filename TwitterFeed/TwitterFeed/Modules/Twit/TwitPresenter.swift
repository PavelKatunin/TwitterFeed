import UIKit

final class TwitPresenter {

    fileprivate weak var view: TwitViewProtocol!
    fileprivate let interactor: TwitInteractorProtocol
    fileprivate let router: TwitWireframeProtocol
    
    weak var output: TwitOutput?

    init(view: TwitViewProtocol, interactor: TwitInteractorProtocol, router: TwitWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TwitPresenter: TwitViewPresenter {
    
    func likeButtonTapped() {
        
    }
    
    func imageLoaded() {
        
    }
    
    func shareButtonTapped() {
        
    }
    
    func viewLoaded() {
        view?.title = "Twit"
    }
}

extension TwitPresenter: TwitInteractorPresenter {
    
}

extension TwitPresenter: TwitIO {
    
}
