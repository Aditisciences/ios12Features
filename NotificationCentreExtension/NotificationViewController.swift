//
//  NotificationViewController.swift
//  NotificationCentreExtension
//
//  Created by cl-macmini-128 on 25/09/18.
//  Copyright © 2018 cl-macmini-128. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    var notification: UNNotification?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func notificationClick(_ sender: Any) {
        print("notification ++++++", notification?.request.content.body)
        self.textLabel?.text = notification?.request.content.body
    }
    
    func didReceive(_ notification: UNNotification) {
       self.notification = notification
    }

}
