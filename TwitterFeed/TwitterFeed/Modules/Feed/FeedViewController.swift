import UIKit

final class FeedViewController: UIViewController, FeedViewProtocol {

	var presenter: FeedViewPresenter!

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }

}
