import Foundation
import SwifteriOS

extension Swifter {
    
        public func postTweetFilters(track: [String]? = nil,
                                     progress: SuccessHandler? = nil,
                                     stallWarningHandler: StallWarningHandler? = nil,
                                     failure: FailureHandler? = nil) -> HTTPRequest {
            
            return postTweetFilters(follow: nil,
                                    track: track,
                                    locations: nil,
                                    delimited: nil,
                                    stallWarnings: nil,
                                    filterLevel: nil,
                                    language: nil,
                                    progress: progress,
                                    stallWarningHandler: stallWarningHandler,
                                    failure: failure)
            
    }
    
}
