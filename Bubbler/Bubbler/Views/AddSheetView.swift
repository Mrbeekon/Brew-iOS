//
//  AddSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
// help from https://blckbirds.com/post/core-data-and-swiftui/
//

import SwiftUI

struct AddSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var brewName = ""
    @State var dateCreated = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Brew Name", text: $brewName)
                }
                Section {
                    Button(action: {
                        guard self.brewName != "" else {return}
                            let newBrew = BrewEntity(context: viewContext) //indented?
                        newBrew.name = self.brewName
                        newBrew.id = UUID()
                        newBrew.notificationIsSet = false
                        do {
                            try viewContext.save()
                            print("Brew saved")
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Add Brew")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Cancel Brew")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
            .navigationTitle("Add Brew")
        }
    }
}

struct AddSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSheetView()
    }
}
