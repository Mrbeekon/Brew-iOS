//
//  AddReadingSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/04/2021.
//

import SwiftUI

struct ChangeReadingSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var newGravityReading = ""
    @State var newDateRecorded = Date()
    
    @ObservedObject var brew: BrewEntity
    
    let oldDate: Date
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Specific Gravity")) {
                    TextField("New Reading", text: $newGravityReading)
                        .keyboardType(.decimalPad)
                    DatePicker(
                        "New Date",
                        selection: $newDateRecorded,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
                Section {
                    Button(action: {
                        guard self.newGravityReading != "" else {return}
                        brew.readings.removeValue(forKey: oldDate)
                        brew.readings[newDateRecorded] = newGravityReading
                        brew.calculateAbv()
                        do {
                            try viewContext.save()
                            print("Reading saved")
                            self.brew.objectWillChange.send()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Change Reading")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Cancel reading")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
            .navigationTitle("Change Gravity Reading")
        }
    }
}
