import Foundation
import UIKit

// MARK: - Wireframe

protocol TweetWireframeProtocol: class {

}

// MARK: - Presenter

protocol TweetViewPresenter: class {
    func viewLoaded()
    func tweetSetUp()
}

protocol TweetInteractorPresenter: class {
    func didDownload(userImage: UIImage)
}

typealias TweetPresenterProtocol = TweetViewPresenter & TweetInteractorPresenter

// MARK: - Interactor

protocol TweetInteractorProtocol: class {
    func downloadUserImage(url: URL)
}

// MARK: - View

protocol TweetViewProtocol: class {
    var title: String? { set get }
    var tweet: Tweet? { set get }
    var userImage: UIImage? { set get}
}

// MARK: - IO

protocol TweetInput: class {
    
    var tweet: Tweet? { set get }
    
}

protocol TweetOutput: class {
    
}

protocol TweetIO: TweetInput {
    weak var output: TweetOutput? { set get }
}
