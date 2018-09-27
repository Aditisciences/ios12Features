//
//  ViewController.swift
//  ios!2Push
//
//  Created by cl-macmini-128 on 25/09/18.
//  Copyright © 2018 cl-macmini-128. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 10.0, *) {
            let debitOverdraftNotifCategory = UNNotificationCategory(identifier: "debitOverdraftNotification", actions: [], intentIdentifiers: [], options: [])
            
            UNUserNotificationCenter.current().setNotificationCategories([debitOverdraftNotifCategory])
        }
    }
    @IBAction func Sendnotifications(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                guard settings.authorizationStatus == .authorized else { return }
                
                // create the content and style for the local notification
                let content = UNMutableNotificationContent()
                
                // #2.1 - "Assign a value to this property that matches the identifier
                // property of one of the UNNotificationCategory objects you
                // previously registered with your app."
                content.categoryIdentifier = "debitOverdraftNotification"
                
                // create the notification's content to be presented
                // to the user
                content.title = "DEBIT OVERDRAFT NOTICE!"
                content.subtitle = "Exceeded balance by $300.00."
                content.body = "One-time overdraft fee is $25. Should we cover transaction?"
                content.sound = UNNotificationSound.default
                
                // #2.2 - create a "trigger condition that causes a notification
                // to be delivered after the specified amount of time elapses";
                // deliver after 10 seconds
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                // create a "request to schedule a local notification, which
                // includes the content of the notification and the trigger conditions for delivery"
                let uuidString = UUID().uuidString
                let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                
                // "Upon calling this method, the system begins tracking the
                // trigger conditions associated with your request. When the
                // trigger condition is met, the system delivers your notification."
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }
}

