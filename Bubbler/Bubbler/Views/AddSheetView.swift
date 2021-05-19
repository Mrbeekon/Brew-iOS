//
//  AddSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//
//  Sheet to add a new brew

import SwiftUI

struct AddSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var brewName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Brew Name", text: $brewName)
                }
            }
            .navigationTitle("Add Brew")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        impactAdd.impactOccurred()
                        // if no name Add sheet will just dismiss
                        guard self.brewName != "" else {return presentationMode.wrappedValue.dismiss()}
                        let newBrew = BrewEntity(context: viewContext)
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
                    }
                }
            }
        }
    }
}
