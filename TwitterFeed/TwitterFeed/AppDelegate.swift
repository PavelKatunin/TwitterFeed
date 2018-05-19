//
//  AppDelegate.swift
//  TwitterFeed
//
//  Created by Pavel Katunin on 5/12/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//

import UIKit
import OhhAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Services.sharedInstance.twitterService.startTweetsObserving(forKeyword: "google",
                                                                    tweetsCountLimit: 1)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}

