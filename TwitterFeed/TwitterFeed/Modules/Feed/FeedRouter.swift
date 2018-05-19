import UIKit

final class FeedRouter: FeedWireframeProtocol {
    
    fileprivate weak var view: (UIViewController & FeedViewProtocol)?
    
    static func createModule(output: FeedOutput? = nil) throws -> ViperModule<UIViewController, FeedIO> {
        let view = FeedViewController(nibName: nil, bundle: nil)
        let interactor = FeedInteractor()
        let router = FeedRouter()
        let presenter = FeedPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        presenter.output = output
        
        return ViperModule(view: view, input: presenter)
    }
}
