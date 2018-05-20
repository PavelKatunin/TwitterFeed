import Foundation

// MARK: - Wireframe

protocol FeedWireframeProtocol: class {

}

// MARK: - Presenter

protocol FeedViewPresenter: class {
    
    func viewLoaded()
    func didEnter(keyword: String)
    
}

protocol FeedInteractorPresenter: class {
    func didReceive(tweets: [Tweet])
    func didReceive(error: Error)
}

typealias FeedPresenterProtocol = FeedViewPresenter & FeedInteractorPresenter

// MARK: - Interactor

protocol FeedInteractorProtocol: class {
    
    func observeTweetsFor(keyword: String)
    
}

// MARK: - View

protocol FeedViewProtocol: class {
    
    var title: String? { set get }
    func add(tweets: [Tweet])
    func showError(text: String)
    func resetTweets()
}

// MARK: - IO

protocol FeedInput: class {
    
}

protocol FeedOutput: class {
    
}

protocol FeedIO: FeedInput {
    
    weak var output: FeedOutput? { set get }
    
}
