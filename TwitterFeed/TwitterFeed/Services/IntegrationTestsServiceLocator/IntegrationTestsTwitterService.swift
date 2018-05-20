import Foundation

class IntegrationTestsTwitterService: TwitterService {
    
    let googleTweets: [Tweet]
    let artTweets: [Tweet]
    
    var currentGoogleTweetIndex = 0
    var currentArtTweetIndex = 0
    var currentKeyword = ""
    
    static let sharedInstance = IntegrationTestsTwitterService()
    
    // TODO: make weak, refactor observing
    var observers = [TweetsObserver]()
    
    static func testJsonData(fileName: String) -> Data {
        
        let testBundle = Bundle.main
        
        guard let path = testBundle.path(forResource: fileName, ofType: "json") else {
            fatalError()
        }
        
        var data: Data?
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path), options: .dataReadingMapped)
        }
        catch {
            fatalError("Cannot create countries service")
        }
        
        return data!
    }
    
    private init() {
        do {
            let googleJson = IntegrationTestsTwitterService.testJsonData(fileName: "googleTweets")
            let artJson = IntegrationTestsTwitterService.testJsonData(fileName: "artTweets")
            
            googleTweets = try JSONDecoder().decode([Tweet].self, from: googleJson)
            artTweets = try JSONDecoder().decode([Tweet].self, from: artJson)
        }
        catch {
            print(error)
            fatalError()
        }
    }
    
    func pushNextTweet() {
        
        if currentKeyword.lowercased() == "google" {
            notifyObserversAbout(tweets: [googleTweets[currentGoogleTweetIndex]])
            currentGoogleTweetIndex += 1
        }
        else if currentKeyword.lowercased() == "art" {
            notifyObserversAbout(tweets: [artTweets[currentArtTweetIndex]])
            currentArtTweetIndex += 1
        }
        
    }
    
    func startTweetsObserving(forKeyword keyword: String, tweetsCountLimit: Int) {
        currentKeyword = keyword
    }
    
    func stopTweetsObserving() {
        print("observing stopped")
    }
    
    func add(observer: TweetsObserver) {
        observers.append(observer)
    }
    
    func remove(observer: TweetsObserver) {
        //TODO: implement
    }
    
    private func notifyObserversAbout(tweets: [Tweet]) {
        observers.forEach { (observer) in
            observer.service(self, didReturnTweets: tweets)
        }
    }
    
    private func notifyObserversAbout(error: Error) {
        observers.forEach { (observer) in
            observer.service(self, didReturnError: error)
        }
    }
    
    
}
