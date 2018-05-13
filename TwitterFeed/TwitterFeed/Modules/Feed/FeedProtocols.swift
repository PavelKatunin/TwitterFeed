import Foundation

// MARK: - Wireframe

protocol FeedWireframeProtocol: class {

}

// MARK: - Presenter

protocol FeedViewPresenter: class {
    func viewLoaded()
}

protocol FeedInteractorPresenter: class {
    
}

typealias FeedPresenterProtocol = FeedViewPresenter & FeedInteractorPresenter

// MARK: - Interactor

protocol FeedInteractorProtocol: class {
    
}

// MARK: - View

protocol FeedViewProtocol: class {
    var title: String? { set get }
}

// MARK: - IO

protocol FeedInput: class {
    
}

protocol FeedOutput: class {
    
}

protocol FeedIO: FeedInput {
    weak var output: FeedOutput? { set get }
}
