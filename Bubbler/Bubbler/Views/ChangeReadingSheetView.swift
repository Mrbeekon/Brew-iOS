//
//  AddReadingSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/04/2021.
//

import SwiftUI
import Combine

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
                        .onReceive(Just(newGravityReading)) { newValue in
                            let filtered = newValue.filter { "0123456789.".contains($0) }
                            if filtered != newValue {
                                self.newGravityReading = filtered
                            }
                        }
                    DatePicker(
                        "Date and time",
                        selection: $newDateRecorded,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
            }
            .navigationTitle("Change Gravity Reading")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Change") {
                        guard self.newGravityReading != "" else {return presentationMode.wrappedValue.dismiss()}
                        brew.readings.removeValue(forKey: oldDate)
                        brew.addReading(readingDate: newDateRecorded, readingValue: newGravityReading)
                        brew.sortReadings()
                        brew.calculateAbv()
                        do {
                            try viewContext.save()
                            self.brew.objectWillChange.send()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    .buttonStyle(AddButton())
                }
            }
        }
    }
}
