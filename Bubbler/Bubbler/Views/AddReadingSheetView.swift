//
//  AddReadingSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/04/2021.
//

import SwiftUI
import Combine

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
                        // Only allow numbers and decimals
                        .onReceive(Just(gravityReading)) { newValue in
                            let filtered = newValue.filter { "0123456789.".contains($0) }
                            if filtered != newValue {
                                self.gravityReading = filtered
                            }
                        }
                    DatePicker(
                        "Date and time",
                        selection: $dateRecorded,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
                Section {
                    Button(action: {
                        guard self.gravityReading != "" else {return}
                        brew.addReading(readingDate: dateRecorded, readingValue: gravityReading)
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
