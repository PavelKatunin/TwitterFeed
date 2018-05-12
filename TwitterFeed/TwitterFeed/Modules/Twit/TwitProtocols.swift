import Foundation
import UIKit

// MARK: - Wireframe

protocol TwitWireframeProtocol: class {

}

// MARK: - Presenter

protocol TwitViewPresenter: class {
    
    func viewLoaded()
    func likeButtonTapped()
    func imageLoaded()
    func shareButtonTapped()
    
}

protocol TwitInteractorPresenter: class {
    
}

typealias TwitPresenterProtocol = TwitViewPresenter & TwitInteractorPresenter

// MARK: - Interactor

protocol TwitInteractorProtocol: class {
    
}

// MARK: - View

protocol TwitViewProtocol: class {
    
    var title: String? { set get }
    var text: String? { set get }
    var image: UIImage? { set get }
    
}

// MARK: - IO

protocol TwitInput: class {
    
}

protocol TwitOutput: class {
    
}

protocol TwitIO: TwitInput {
    weak var output: TwitOutput? { set get }
}
