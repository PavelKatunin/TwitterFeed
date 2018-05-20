import UIKit

final class TweetViewController: UIViewController, TweetViewProtocol {
    
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
    
    var userImage: UIImage? {
        didSet {
            if isViewLoaded {
                updateUiFor(tweet: tweet)
            }
        }
    }
    
    private func updateUiFor(tweet: Tweet?) {
        textLabel.text = tweet?.text ?? ""
        nameLabel.text = tweet?.user?.screenName ?? ""
        
        if tweet != nil {
            profileImageView.image = userImage
        }
        else {
            profileImageView.image = nil
        }
        
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        updateUiFor(tweet: tweet)
    }

}
