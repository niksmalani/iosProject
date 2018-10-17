//
//  AppDelegate.swift
//  SocialMedia
//
//  Created by Niks on 13/10/18.
//  Copyright © 2018 Niks. All rights reserved.
//

import UIKit
import GoogleSignIn
import UserNotifications
import FacebookCore
import FBSDKCoreKit
import FacebookLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "904188069689-k578ka9qcq2j18nkmgqn7uivraik4pdf.apps.googleusercontent.com"

        return true
    
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let handled: Bool = (FBSDKApplicationDelegate.sharedInstance()?.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation))!
        return handled
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

    func applicationDidBecomeActive(application: UIApplication) {
        // Call the 'activate' method to log an app event for use
        // in analytics and advertising reporting.
        AppEventsLogger.activate(application)
        // ...
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

