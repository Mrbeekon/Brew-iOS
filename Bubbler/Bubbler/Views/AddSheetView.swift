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
                        guard self.brewName != "" else {return presentationMode.wrappedValue.dismiss()}
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
                    }
                }
            }
        }
    }
}

struct AddSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSheetView()
    }
}
