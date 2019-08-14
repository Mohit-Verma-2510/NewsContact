//
//  LocalNotificationManager.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 24/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import UserNotifications


/// Struct For sending nofications.
struct Notifications {
    var id:String
    var title:String
    var description:String
    var datetime:DateComponents?
}

/// Class for sending and modifying notification and deleagtes are in app delegates
class LocalNotificationManager {
    var notifications = [Notifications]()
    
    init() {
        checkNotificationPermission()
    }
    
    ///Sending notification
    func sendNotification(data:Notifications){
        if #available(iOS 10.0, *){
            notficationforIos10(notisData: data)
        }
        else{
            notificationForIosBelow10(notisData: data)
        }
    }
    
    /// Checking Notification Permission
    private func checkNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) {
            (permissionGiven, error) in
            
            if permissionGiven {
                print("Given")
            }
            else{
                guard let settingURL = URL(string: UIApplication.openSettingsURLString) else { return }
                UIApplication.shared.open(settingURL, options: [:], completionHandler: nil)
            }
            
            if let error = error{
                print("The error is :: \(error)")
            }
            
        }
        
    }
    
    /// Notification for iOS 10 above
    private func notficationforIos10(notisData:Notifications){
        print("Notifcation for 10 is called ")
        /// Content of notifcation
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = notisData.title
        //notisContent.subtitle = "Notification sub title"
        notificationContent.body = notisData.description
        notificationContent.badge = 1
        notificationContent.sound = .default
        
        /*
        ///Attachment
        let imageName = "bbc_news_logo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        notisContent.attachments = [attachment]
         */
        
        ///Trigger Notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "Notification" + notisData.id, content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print("The error is error ::: \(error!)")
            }
            else{
                print("No error")
                //UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
        
        print("code excuted")
    }
    
    /// Notification for below iOS 10
    @available(iOS,introduced: 4,deprecated: 10.0,message: "This notification is only for ios version below 10")
    private func notificationForIosBelow10(notisData:Notifications){
        let localNotification = UILocalNotification()
        localNotification.alertTitle = notisData.title
        localNotification.alertBody = notisData.description
        //localNotification.alertAction = "Alert Action"
        localNotification.fireDate = Date()
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
    
}
