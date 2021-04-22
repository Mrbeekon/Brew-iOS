//
//  ReadingsView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

struct ReadingsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: BrewEntity.entity(), sortDescriptors: [])
    var brews: FetchedResults<BrewEntity>
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Readings")
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button("Add") {
                        showAddSheet = true
                    }
                        .buttonStyle(AddButton())
                    .sheet(isPresented: $showAddSheet) {
                            AddSheetView()
                        }
                }
                ScrollView {
                    ForEach(readings) { reading in
                        Spacer()
                        BrewView(brew: brew, isExpanded: self.selection.contains(brew))
                            .onTapGesture { self.selectDeselect(brew) }
                            .animation(.linear(duration: 0.3))
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ReadingsView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingsView()
    }
}
