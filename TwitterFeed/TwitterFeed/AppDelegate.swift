//
//  AppDelegate.swift
//  TwitterFeed
//
//  Created by Pavel Katunin on 5/12/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let cunsomerKey = "izFspU8jhKCcpshf7e0eErcUB"
        let secretKey = "bjbMFs6M9STal3ZMXU8HF94aqkraxisFMxwvGzMdiInu2tAQb9"
        let authString = cunsomerKey + ":" + secretKey
        let authEncoded = authString.toBase64()!
        
        
        let service = RESTAPIService()
        service.getData(mehtod: .POST,
                        url: URL(string: "https://api.twitter.com/oauth2/token")!,
                        headers: [ "Authorization" : "Basic " + authEncoded,
                                   "Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"],
                        parameters: ["grant_type" : "client_credentials" ]) { (result) in
            
                            var tokenString = ""
                            
                            switch result {
                            
                            case .success(let data):
                                do {
                                    let string = String(data: data, encoding: .utf8)
                                    print(string)
                                    let token = try JSONDecoder().decode(Token.self, from: data)
                                    print(token.tokenType)
                                    print(token.accessToken)
                                    tokenString = token.accessToken
                                }
                                catch {
                                    print("\(error)")
                                }
                            case .failure(_):
                                break
                            }
                            
                            print(tokenString)
                            print(tokenString.toBase64()!)
                            let authHeader = "Bearer \(tokenString)"
                            print(authHeader)
                            service.getData(mehtod: .POST,
                                            url: URL(string: "https://stream.twitter.com/1.1/statuses/filter.json")!,
                                            headers: ["Authorization" : authHeader,
                                                      "Accept-Encoding" : "gzip",
                                                      "User-Agent" : "TwitterFeedPK"],
                                            parameters: ["track" : "twitter"],
                                            completion: { (result) in
                                                
                                                switch result {
                                                    
                                                case .success(let data):
                                                    do {
                                                        let string = String(data: data, encoding: .utf8)
                                                        print(string)
                                                    }
                                                case .failure(_):
                                                    break
                                                }
                                                

                            })
                            
            
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

