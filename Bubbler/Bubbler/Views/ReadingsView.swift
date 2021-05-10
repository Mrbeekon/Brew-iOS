//
//  ReadingsView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//
//  View that displays the brew readings (gravity readings) and their interactions

import SwiftUI

struct ReadingsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var brew: BrewEntity
    
    @State private var showAddReadingSheet = false
    
    @State private var showNameChangeSheet = false
    @State private var showReadingChangeSheet = false
    
    static let readingDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm dd-MM-y"
            return formatter
        }()
    
    var body: some View {
        ZStack{
            Color.foam.ignoresSafeArea()
            VStack {
                ZStack{
                    Color.blue
                    HStack{
                        Text(brew.name)
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.foam)
                            .onTapGesture {
                                showNameChangeSheet = true
                            }
                            .sheet(isPresented: $showNameChangeSheet){
                                ChangeNameSheetView(brew: brew)
                            }
                            .shadow(radius: 4, x: -2, y: 4)
                        Spacer()
                        
                        ZStack{
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.lightGold, .darkGold]),
                                        startPoint: .topTrailing,
                                        endPoint: .bottomLeading
                                    )
                                )
                                .frame(width: 70, height: 70, alignment: .center)
                                .shadow(radius: 4, x: -2, y: 4)
                            Text("\(brew.abv ?? "0.00")%")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.offBlack)
                        }
                    }
                    .padding()
                }
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .frame(height: 75, alignment: .center)
                .padding(.top, 10)
                
                HStack {
                    Text("Specific Gravity").foregroundColor(.offBlack).font(.system(size: 20, weight: .bold)).foregroundColor(.offBlack)
                    Spacer()
                    Text("Time and Date").bold().foregroundColor(.offBlack).font(.system(size: 20, weight: .bold)).foregroundColor(.offBlack)
                }
                .padding()

                Divider()
                
                List {
                    if brew.readings.isEmpty {
                        // ForEach to allow for a list item with the same styling as the readings
                        ForEach(1...1, id: \.self) { i in
                            VStack(alignment: .leading, spacing: 10){
                                Text("To add a reading press 'Add' in the top right 🌡")
                            }
                            .listRowBackground(Color.foam)
                        }
                        
                    } else {
                        // sort the readings by date ascending
                        ForEach(Array(brew.readings.sorted(by: <)), id: \.key) { key, reading in
                            HStack {
                                Text(reading).foregroundColor(.offBlack).font(.system(size: 20)).foregroundColor(.offBlack)
                                Spacer()
                                Text("\(key, formatter: Self.readingDateFormat)").foregroundColor(.offBlack)
                                    
                            }
                            .listRowBackground(Color.foam)
                        }
                        .onDelete(perform: { indexSet in
                            for index in indexSet {
                                print("index = ", index) //the index in list
                                // now get date at index
                                let tuple = Array(brew.readings.sorted(by: <))[index]
                                print("tuple = ", tuple)
                                let delDate = tuple.key
                                print("date key = ", delDate)
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
        }
        // applys to navigation view in ContentView.swift
        .navigationTitle("Readings")
        .toolbar {
            Button("Add") {
                showAddReadingSheet = true
            }
        }
        .sheet(isPresented: $showAddReadingSheet) {
            AddReadingSheetView(brew: brew)
        }
    }
}
