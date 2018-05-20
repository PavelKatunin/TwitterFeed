import Foundation
import UIKit

class TweetTableViewCell: UITableViewCell {
    
    var tweetModuleInput: TweetIO?
    
    var tweet: Tweet? {
        didSet {
            tweetModuleInput?.tweet = tweet
        }
    }
    
    var tweetViewController: TweetViewController!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        do {
            let tweetModule = try TweetRouter.createModule()
            tweetViewController = tweetModule.view as! TweetViewController
            tweetModuleInput = tweetModule.input
            tweetViewController.view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(tweetViewController.view)
            tweetViewController.view.activateConstraintsToWrapSuperview()
        }
        catch {
            fatalError("Cannot create tweet module, seems like this is programmer's mistake, should crash")
        }
    }
    
    override func prepareForReuse() {
    
    }
    
}
