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
                Section(header: Text("New brew")) {
                    TextField("Brew Name", text: $brewName)
                    DatePicker(
                        "Start Date",
                        selection: $dateCreated,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Section {
                    Button(action: {
                        guard self.brewName != "" else {return}
                            let newBrew = BrewEntity(context: viewContext)
                        newBrew.name = self.brewName
                        newBrew.startDate = self.dateCreated
                        newBrew.id = UUID()
                        do {
                            try viewContext.save()
                            print("Order saved")
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
