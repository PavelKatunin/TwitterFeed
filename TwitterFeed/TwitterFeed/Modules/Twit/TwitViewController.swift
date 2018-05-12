import UIKit

final class TwitViewController: UIViewController, TwitViewProtocol {
    
    //MARK: - VIPER
	var presenter: TwitViewPresenter!

    //MARK: - Models
    var text: String?
    var image: UIImage?
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }

}
