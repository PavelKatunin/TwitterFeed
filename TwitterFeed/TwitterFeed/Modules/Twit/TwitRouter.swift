import UIKit

final class TwitRouter: TwitWireframeProtocol {
    
    fileprivate weak var view: (UIViewController & TwitViewProtocol)?
    
    static func createModule(output: TwitOutput? = nil) throws -> ViperModule<UIViewController, TwitIO> {
        let view = TwitViewController(nibName: nil, bundle: nil)
        let interactor = TwitInteractor()
        let router = TwitRouter()
        let presenter = TwitPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        presenter.output = output
        
        return ViperModule(view: view, input: presenter)
    }
}
