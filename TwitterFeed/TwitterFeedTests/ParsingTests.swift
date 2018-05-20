import XCTest

@testable import TwitterFeed

class ParsingTests: XCTestCase {
    
    var testJsonData: Data {
        
        let testBundle = Bundle(for: type(of: self))
        
        guard let path = testBundle.path(forResource: "testGoogleTweets", ofType: "json") else {
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
    
    func testParsingTweetsSuccess() {
        do {
            let tweets = try JSONDecoder().decode([Tweet].self, from: testJsonData)
            XCTAssertEqual(tweets.count, 3)
            XCTAssertEqual(tweets[0].text, "Some google tweet, much wow! 🤓 The most exciting tweet abou IT technologies!")
            XCTAssertEqual(tweets[0].user?.screenName, "ITDogo")
        }
        catch {
            XCTAssert(false)
        }
    }
    
}
