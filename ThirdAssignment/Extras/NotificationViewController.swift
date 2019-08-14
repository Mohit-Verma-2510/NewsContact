//
//  NotificationViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 25/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import UserNotifications

/// Push Notification View Controller
class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkNotificationPermission()
    }
    
    @IBAction func sendNotification(_ sender: Any) {
        if #available(iOS 10.0,*) {
            self.notficationforIos10()
        }
        else {
            self.notificationForIosBelow10()
        }
        
    }
    
    @available(iOS,introduced: 4,deprecated: 10.0,message: "This notification is only for ios version below 10")
    func notificationForIosBelow10(){
        let noti = UILocalNotification()
        noti.alertTitle = "Alert Title"
        noti.alertBody = "Alert Body"
        noti.alertAction = "Alert Action"
        noti.fireDate = Date()
        UIApplication.shared.scheduleLocalNotification(noti)
    }
    
    @available(iOS 10.0,*)
    func notficationforIos10(){
        /// Content of notifcation
        let notisContent = UNMutableNotificationContent()
        notisContent.title = "Notifcation title"
        notisContent.subtitle = "Notification sub title"
        notisContent.body = "Notfication body"
        notisContent.badge = 1
        notisContent.sound = .default
        
        ///Attachment
        let imageName = "bbc_news_logo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        notisContent.attachments = [attachment]
        
        ///Trigger Notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "notis.1", content: notisContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            //
            if error != nil {
                print("The error is error ::: \(error!)")
            }
            else{
                print("No error")
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
        
        print("code excuted")
    }
    
    /// Checking Notification Permission
    func checkNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) {
            (permissionGiven, error) in
            
            if permissionGiven {
                print("Given")
            }
            else{
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString )!, options: [:], completionHandler: nil)
            }
            
            if error != nil{
                print("The error is :: \(error!)")
            }
            
        }
        
    }
    
    
}
