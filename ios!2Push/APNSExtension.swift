//
//  APNSExtension.swift
//  ios!2Push
//
//  Created by cl-macmini-128 on 25/09/18.
//  Copyright © 2018 cl-macmini-128. All rights reserved.
//

import Foundation
import UIKit
import  UserNotifications

extension AppDelegate : UNUserNotificationCenterDelegate {
    func registerAppRemoteNotifications() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) {  (granted, error) in
                print(granted)
            }
            UNUserNotificationCenter.current().delegate = self
        }
        app.registerForRemoteNotifications()
    }
    func unregisterAppRemoteNotifications() {
        app.unregisterForRemoteNotifications()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNs device token: \(deviceTokenString)")
        //NSLog("APNs device token: \(deviceTokenString)")
        self.deviceToken = deviceTokenString
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNs registration failed: \(error)")
        self.deviceToken = "A451D88124A9F6712FCB8DABDAF87DD511D38DB2E874DBED71F73CED04B3B01E"
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print(userInfo)
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.categoryIdentifier = "debitOverdraftNotification"
            content.title = "DEBIT OVERDRAFT NOTICE!"
            content.subtitle = "Exceeded balance by $300.00."
            content.body = "One-time overdraft fee is $25. Should we cover transaction?"
            content.sound = UNNotificationSound.default
        }
    }
}
