//
//  AddSheet.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//  adapted from https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications
//
//  Sets the notifications to remind the user to take a reading

import SwiftUI
import UserNotifications

struct NotificationSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @State var days = ""
    @State var time = Date()
    
    @ObservedObject var brew: BrewEntity
    
    func setNotification() {
        if brew.notificationIsSet {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Reminder set")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Check your brew 🍺"
            content.subtitle = brew.name + " is waiting for a reading!"
            content.sound = UNNotificationSound.default

            let components = Calendar.current.dateComponents([.hour, .minute], from: time)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            
            // choose a random identifier
            let request = UNNotificationRequest(identifier: brew.id.uuidString, content: content, trigger: trigger)
            
            // add our notification request
            UNUserNotificationCenter.current().add(request)
        } else {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [brew.id.uuidString])
            print("Reminder off")
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
                    }
                }
            }
            .navigationTitle("Set a Reminder")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Set") {
                        setNotification()
                        do {
                            try viewContext.save()
                            self.brew.objectWillChange.send()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}

