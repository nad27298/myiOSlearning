//
//  MH2ViewController.swift
//  NotesApp
//
//  Created by MeoBeo on 10/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import SQLite
import UserNotifications

class MH2ViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var txtInsert: UITextView!
    
    var dulieu:AppNotes!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (dulieu != nil) {
            txtInsert.text = dulieu.notes
            let timeStamp = TimeInterval(dulieu.time)
            let myTimeStamp = Date(timeIntervalSince1970: timeStamp)
            datePicker.date = myTimeStamp
        }
    }
    
    @IBAction func btn_Save(_ sender: Any) {
        if (dulieu == nil) {
            let myTimeStamp = self.datePicker?.date.timeIntervalSince1970
            let timeStamp = Int64(myTimeStamp!)
            _ = Notes.shared.insert(notes: txtInsert.text, check: false, time: timeStamp)
            
            let center = UNUserNotificationCenter.current()
            let options: UNAuthorizationOptions = [.alert, .sound];
            center.requestAuthorization(options: options) {
                (granted, error) in
                if !granted {
                    print("Something went wrong")
                }
            }
            let content = UNMutableNotificationContent()
            content.body = txtInsert.text
            content.sound = UNNotificationSound.default
            content.userInfo = ["Important":"Data"];
            let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,], from: datePicker.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                        repeats: false)
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    print(error)
                }
            })
            
            self.navigationController?.popViewController(animated: true)

        } else {
            let myTimeStamp = self.datePicker?.date.timeIntervalSince1970
            let timeStamp = Int64(myTimeStamp!)
            _ = Notes.shared.update(id: dulieu.id, notes: txtInsert.text, check: dulieu.check, time: timeStamp)
            
//            let localNotification = UILocalNotification()
//            localNotification.fireDate = datePicker.date
//            localNotification.alertBody = txtInsert.text
//            localNotification.timeZone = NSTimeZone.local
//            localNotification.userInfo = ["Important":"Data"];
//            localNotification.soundName = UILocalNotificationDefaultSoundName
//            localNotification.applicationIconBadgeNumber = 1
//            localNotification.category = "Message"
//            UIApplication.shared.scheduleLocalNotification(localNotification)
            
            let center = UNUserNotificationCenter.current()
            let options: UNAuthorizationOptions = [.alert, .sound];
            center.requestAuthorization(options: options) {
                (granted, error) in
                if !granted {
                    print("Something went wrong")
                }
            }
            let content = UNMutableNotificationContent()
            content.body = txtInsert.text
            content.sound = UNNotificationSound.default
            content.userInfo = ["Important":"Data"];
            let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,], from: datePicker.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                        repeats: false)
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    print(error)
                }
            })
//            let snoozeAction = UNNotificationAction(identifier: "Snooze",
//                                                    title: "Snooze", options: [])
//            let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
//                                                    title: "Delete", options: [.destructive])
//            let category = UNNotificationCategory(identifier: "UYLReminderCategory",
//                                                  actions: [snoozeAction,deleteAction],
//                                                  intentIdentifiers: [], options: [])
//            center.setNotificationCategories([category])
//            content.categoryIdentifier = "UYLReminderCategory"
//            center.removeAllPendingNotificationRequests()
            
            self.navigationController?.popViewController(animated: true)
        }
    }


    
}
