//
//  AddSheet.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//

import SwiftUI
import UserNotifications

struct AlertsSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @State var days = ""
    @State var time = Date()
    
    @ObservedObject var brew: BrewEntity
    
    func setNotification() {
        if brew.notificationIsSet {
            print("on")
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Reminder set")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            let content = UNMutableNotificationContent()
            content.title = "Check your brew 🍺"
            content.subtitle = "It's time to take a reading of " + brew.name
            content.sound = UNNotificationSound.default

            let components = Calendar.current.dateComponents([.hour, .minute], from: time)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            

            // add our notification request
            UNUserNotificationCenter.current().add(request)
        } else {
            print("off")
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section() {
                        DatePicker("Repeat every day at",
                            selection: $time,
                            displayedComponents: [.hourAndMinute])
                        Toggle("Start notification", isOn: $brew.notificationIsSet)
                            .onChange(of: brew.notificationIsSet){ value in
                                setNotification()
                            }
                    }
                    Section{
                        Button(action: {
                            print("Reminder Done")
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Done")
                        }
                    }
                }
            }
            .navigationTitle("Set a Reminder")
        }
    }
}

