import XCTest
import EarlGrey
@testable import TwitterFeed

class TweeterFeedIntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChangingKeywords() {
        let typeGoogleAction = grey_replaceText("google")
        EarlGrey.selectElement(with: grey_accessibilityLabel("keywordTextField")).perform(typeGoogleAction)
        EarlGrey.selectElement(with: grey_accessibilityID("goButton")).perform(GREYActions.actionForTap())
        IntegrationTestsTwitterService.sharedInstance.pushNextTweet()
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        IntegrationTestsTwitterService.sharedInstance.pushNextTweet()
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        IntegrationTestsTwitterService.sharedInstance.pushNextTweet()
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        
        EarlGrey.selectElement(with: grey_accessibilityLabel("keywordTextField")).perform(GREYActions.actionForClearText())
        
        let typeArtAction = grey_replaceText("art")
        EarlGrey.selectElement(with: grey_accessibilityLabel("keywordTextField")).perform(typeArtAction)
        EarlGrey.selectElement(with: grey_accessibilityID("goButton")).perform(GREYActions.actionForTap())
        IntegrationTestsTwitterService.sharedInstance.pushNextTweet()
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        IntegrationTestsTwitterService.sharedInstance.pushNextTweet()
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        IntegrationTestsTwitterService.sharedInstance.pushNextTweet()
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
    }

}
