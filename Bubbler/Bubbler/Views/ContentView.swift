//
//  ContentView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/03/2021.
//

import SwiftUI
import CoreData

/*let brews = [
    Brew(name: "Hazy IPA", abv: "4.25%", og: "1.050", sg: "1.030", fg: "1.010"),
    Brew(name: "Czech Pils", abv: "4.00%", og: "1.045", sg: "1.020", fg: "1.008"),
    Brew(name: "Absolute Bitter", abv: "8.50%", og: "1.078", sg: "1.0500", fg: "1.010"),
    ]*/

struct ContentView: View {
    
    @State private var showAddSheet = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Brews")
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button("Add") {
                        showAddSheet = true
                    }
                        .buttonStyle(AddButton())
                    .sheet(isPresented: $showAddSheet) {
                            AddSheetView()
                        }
                }
                BrewsListView()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
