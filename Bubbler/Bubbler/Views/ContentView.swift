//
//  ContentView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/03/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var showAddSheet = false
    
    init() {
        // Sets the colour but requires editing table view directly
        UITableView.appearance().backgroundColor = .foam // Uses UIColor
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.offBlack]
    }
    
    func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    var body: some View {
        NavigationView {
            BrewsListView()
                .navigationTitle("Brews")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Add") {
                            showAddSheet = true
                        }
                        .sheet(isPresented: $showAddSheet) {
                                AddSheetView()
                        }
                    }
                }
        }
        .preferredColorScheme(.light)
    }
}
