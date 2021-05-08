//
//  AddReadingSheetView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/04/2021.
//

import SwiftUI

struct ChangeNameSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var newName = ""
    
    @ObservedObject var brew: BrewEntity
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Brew Name")) {
                    TextField("New Name", text: $newName)
                }
            }
            .navigationTitle("Change Brew Name")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Change") {
                        guard self.newName != "" else {return presentationMode.wrappedValue.dismiss()}
                        brew.name = self.newName
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
