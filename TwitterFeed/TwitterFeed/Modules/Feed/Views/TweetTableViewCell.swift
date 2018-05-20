import Foundation
import UIKit

class TweetTableViewCell: UITableViewCell {
    
    static func estimatedHeightFor(width: CGFloat) -> CGFloat {
        return 100
    }
    
    var tweet: Tweet? {
        didSet {
            
        }
    }
    
    weak var tweetPresenter: TweetPresenter!
    weak var tweetViewController: TweetViewController!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
