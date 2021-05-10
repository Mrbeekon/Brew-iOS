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
            }
            .navigationTitle("Add Gravity Reading")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        guard self.gravityReading != "" else {return presentationMode.wrappedValue.dismiss()}
                        brew.addReading(readingDate: dateRecorded, readingValue: gravityReading)
                        brew.calculateAbv()
                        do {
                            try viewContext.save()
                            self.brew.objectWillChange.send()
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
