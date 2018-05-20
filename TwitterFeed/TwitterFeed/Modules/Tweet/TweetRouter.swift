import UIKit

final class TweetRouter: TweetWireframeProtocol {
    
    fileprivate weak var view: (UIViewController & TweetViewProtocol)?
    
    static func createModule(output: TweetOutput? = nil) throws -> ViperModule<UIViewController, TweetIO> {
        let view = TweetViewController.instantiate(storyboardName: "TweetStoryboard") as! TweetViewController
        let interactor = TweetInteractor(httpClient: Services.sharedInstance.httpClient)
        let router = TweetRouter()
        let presenter = TweetPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        presenter.output = output
        
        return ViperModule(view: view, input: presenter)
    }
}
