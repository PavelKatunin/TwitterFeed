import UIKit

final class FeedViewController: UIViewController,
                                FeedViewProtocol,
                                UITableViewDataSource,
                                UITableViewDelegate {

	var presenter: FeedViewPresenter!
    
    
    @IBOutlet var keywordTextfield: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var tweets = [Tweet]()
    let cellId = "tweetCell"
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @IBAction func goButtonTapped(_ sender: UIButton) {
        presenter.didEnter(keyword: keywordTextfield.text ?? "")
    }
    
    func add(tweets: [Tweet]) {
        self.tweets.append(contentsOf: tweets)
        tableView.reloadData()
    }
    
    func resetTweets() {
        tweets = [Tweet]()
        tableView.reloadData()
    }
    
    func showError(text: String) {
        let alert = UIAlertController(title: "Error",
                                      message: text,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
                                      style: .default,
                                      handler: { _ in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TweetTableViewCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }

}
