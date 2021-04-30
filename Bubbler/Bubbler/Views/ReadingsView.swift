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
    
    static let readingDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm d-MM-y"
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Readings")
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button("Add") {
                        showAddReadingSheet = true
                    }
                        .buttonStyle(AddButton())
                    .sheet(isPresented: $showAddReadingSheet) {
                        AddReadingSheetView(brew: brew)
                        }
                }
                HStack {
                    Text(brew.name)
                        .multilineTextAlignment(.leading)
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
                    ForEach(brew.readings.sorted(by: <), id: \.key) { key, reading in
                        HStack {
                            Text(reading)
                            Spacer()
                            Text("\(key, formatter: Self.readingDateFormat)")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        print("beep")
                    })
                }
            }
            .navigationBarHidden(true)
        }
    }
}
