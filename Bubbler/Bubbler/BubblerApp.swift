//
//  BubblerApp.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/03/2021.
//

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
