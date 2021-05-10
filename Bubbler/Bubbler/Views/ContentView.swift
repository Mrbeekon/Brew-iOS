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
        UITableView.appearance().backgroundColor = .foam // Uses UIColor
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.offBlack]

        //Use this if NavigationBarTitle is with displayMode = .inline
        //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.offBlack]
    }
    
    func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    var body: some View {
        //Text("Bubbler")
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
    }
}
