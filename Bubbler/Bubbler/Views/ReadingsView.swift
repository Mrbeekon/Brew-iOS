//
//  ReadingsView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

struct ReadingsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var brew: BrewEntity
    
    @State private var showAddReadingSheet = false
    
    @State var newName = ""
    
    @State private var showNameChangeSheet = false
    @State private var showReadingChangeSheet = false
    
    static let readingDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm d-MM-y"
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(brew.name){
                        print("beep")
                        showNameChangeSheet = true
                    }
                    .buttonStyle(HiddenButton())
                    .multilineTextAlignment(.leading)
                    .sheet(isPresented: $showNameChangeSheet){
                        ChangeNameSheetView(brew: brew)
                    }
                    
                    /*Text(brew.name)
                        .onTapGesture {
                            print("boop")
                            TextField(brew.name, text: $newName)
                        }*/
                    
                    Spacer()
                    Text(brew.abv ?? "N/A")
                        .onAppear{
                            brew.calculateAbv()
                            do {
                                try viewContext.save()
                                print("ABV saved")
                                self.brew.objectWillChange.send()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                        .multilineTextAlignment(.trailing)
                }
                List {
                    ForEach(Array(brew.readings), id: \.key) { key, reading in
                        HStack {
                            Text(reading)
                            Spacer()
                            Text("\(key, formatter: Self.readingDateFormat)")
                        }
                        .onTapGesture {
                            showReadingChangeSheet = true
                        }
                        .sheet(isPresented: $showReadingChangeSheet){
                            ChangeReadingSheetView(brew: brew, oldDate: key)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            print(index) //the index in list
                            // now get date at index
                            let delDate = Array(brew.readings.keys)[index]
                            // next delete the item with that key
                            brew.readings.removeValue(forKey: delDate)
                            brew.calculateAbv()
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print("here")
                            print(error.localizedDescription)
                        }
                    })
                }
            }
        }
        .navigationTitle("Readings")
        .toolbar {
            Button("Add") {
                showAddReadingSheet = true
            }
                .buttonStyle(AddButton())
        }
        .sheet(isPresented: $showAddReadingSheet) {
            AddReadingSheetView(brew: brew)
            }
    }
}
