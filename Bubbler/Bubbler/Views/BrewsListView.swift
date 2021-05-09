//
//  BrewsListView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

struct BrewsListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: BrewEntity.entity(), sortDescriptors: [])
    var brews: FetchedResults<BrewEntity>
    
    @State private var selection: Set<BrewEntity> = []
    @State private var showAlert: Bool = false
    
    func selectDeselect(_ brew: BrewEntity) {
        print("Selected \(brew.id)")
        if selection.contains(brew) {
            selection.remove(brew)
        } else {
            selection.insert(brew)
        }
    }
    
    var body: some View {
         List {
            if brews.isEmpty {
                ForEach(1...1, id: \.self) { i in
                    VStack(alignment: .leading, spacing: 10){
                        Text("Welcome to Bubbler! 🍻").bold()
                        Spacer()
                        Text("Currently you have no brews to view.")
                        Spacer()
                        Text("Lets fix that.")
                        Spacer()
                        Text("Press the 'Add' button in the top right.").bold()
                    }
                    .listRowBackground(Color.foam)
                }
                
            } else {
                ForEach(brews) { brew in
                    BrewView(brew: brew, isExpanded: self.selection.contains(brew))
                        .onTapGesture { self.selectDeselect(brew) }
                        .animation(.linear(duration: 0.3))
                        .listRowBackground(Color.foam)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        viewContext.delete(brews[index])
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
