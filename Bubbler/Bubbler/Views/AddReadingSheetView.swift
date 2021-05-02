//
//  AddReadingSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/04/2021.
//

import SwiftUI

struct AddReadingSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var gravityReading = ""
    @State var dateRecorded = Date()
    
    @ObservedObject var brew: BrewEntity
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Specific Gravity")) {
                    TextField("Add Reading", text: $gravityReading)
                        .keyboardType(.decimalPad)
                    DatePicker(
                        "Date and time",
                        selection: $dateRecorded,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
                Section {
                    Button(action: {
                        guard self.gravityReading != "" else {return}
                        
                        brew.readings[dateRecorded] = gravityReading
                        brew.calculateAbv()
                        do {
                            try viewContext.save()
                            print("ABV saved")
                            self.brew.objectWillChange.send()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Add Reading")
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
            .navigationTitle("Add Gravity Reading")
        }
    }
}
