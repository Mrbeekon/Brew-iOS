//
//  AddSheet.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//

import SwiftUI
import UserNotifications

struct AlertsSheetView: View {
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }

            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Check your brew 🍺"
                content.subtitle = "It's time to take a reading"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
            Button(action: {
                print("Cancel Alert")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            }
        }
        
    }
}

struct AlertsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsSheetView()
    }
}
