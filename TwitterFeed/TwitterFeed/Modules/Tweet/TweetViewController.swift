import UIKit

final class TweetViewController: UIViewController, TweetViewProtocol {

    static func estimatedHeightFor(width: CGFloat) -> CGFloat {
        //TODO: Fix
        return 100
    }
    
	var presenter: TweetViewPresenter!
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var additionalActionsButton: UIButton!
    
    var tweet: Tweet? {
        didSet {
            if isViewLoaded {
                updateUiFor(tweet: tweet)
            }
        }
    }
    
    private func updateUiFor(tweet: Tweet?) {
        textLabel.text = tweet?.text ?? ""
        nameLabel.text = tweet?.user?.screenName ?? ""
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }

}
