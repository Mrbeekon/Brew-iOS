//
//  BubblerApp.swift
//  Bubbler
//
//  Bubbler is an app that allows a user to store their homebrews and corresponding gravity readings.
//
//  Created by Sam Kirk on 22/03/2021.
//
//  However, I am anything but a self made man (https://www.youtube.com/watch?v=s4_11ApT26k ).
//  Below are the links to tutorials and code used.
//
//  SVG to Path converter: https://quassummanus.github.io/SVG-to-SwiftUI/
//  Working with core data: https://blckbirds.com/post/core-data-and-swiftui/
//  Expand and collapse brew item: https://www.vadimbulavin.com/expand-and-collapse-list-with-animation-in-swiftui/
//  Local notifications: https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications
//  Lock to portrait: https://stackoverflow.com/questions/28938660/how-to-lock-orientation-of-one-view-controller-to-portrait-mode-only-in-swift
//  Grpah library: https://github.com/AppPear/ChartView

import SwiftUI

@main
struct BubblerApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
