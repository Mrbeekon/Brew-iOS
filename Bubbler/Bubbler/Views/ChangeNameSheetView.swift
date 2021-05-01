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
                Section {
                    Button(action: {
                        guard self.newName != "" else {return}
                        
                        brew.name = self.newName
                        do {
                            try viewContext.save()
                            print("ABV saved")
                            self.brew.objectWillChange.send()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Save change")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Cancel name change")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
            .navigationTitle("Change Brew Name")
        }
    }
}
