# TwitterFeed
Twitter feed

# Warning
To make the project working, change strings in PKTwitterConfig.swift file,
or implement your own class which confims to the TwitterConfig protocol.
To get all needed keys check out https://apps.twitter.com/

You need to register a new app and generate 4 strings: Keys and Access tokens tab.

# Description

![alt text](https://user-images.githubusercontent.com/1636737/40282166-cd9689e4-5c73-11e8-875c-9cfc8824d7a4.gif)

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

# Known issues:

1. Resize tableView when keyboard appears.
2. More descriptive error messages.
3. Limit on feeds subscribing.
4. Some more issues, hey, this is just a test project, it took not so much time.
