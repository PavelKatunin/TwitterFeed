# TwitterFeed
Twitter feed

![alt text](https://user-images.githubusercontent.com/1636737/40282030-6e52a4f6-5c71-11e8-9db7-86e8fd1f5ec5.gif)

Twitter client that uses Twitter API to stream tweets by a keyword.
Developerd using VIPER arhitecure. https://www.objc.io/issues/13-architecture/viper/

Built using cocoapods and Swifter library https://github.com/httpswift/swifter

To install the app, open TwitterFeed/TwitterFeed.xcworkspace with xCode

# Build: 

choose TwitterFeed target and click Run button (Cmd + R)

# Test:

to run tests open xCode -> Product -> Test (Cmd + U)

There are 2 test targets: Unit tests and Integration tests.

TwitterFeedIntegrationTests states for UI tests with injected test services, 
so test application doesn't make real HTTP calls to the Twitter API.
Implemented with EarlGrey iOS framework.

TwitterFeedTests for Unit tests.
