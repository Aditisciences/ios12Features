//
//  AppDelegate.swift
//  ios!2Push
//
//  Created by cl-macmini-128 on 25/09/18.
//  Copyright © 2018 cl-macmini-128. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var deviceToken: String!
    var appDelegate: AppDelegate {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate
        }
        fatalError("no appdelegate")
    }
    
    var app: UIApplication {
        return UIApplication.shared
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if #available(iOS 10.0, *) {
            appDelegate.registerAppRemoteNotifications()
        }
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
