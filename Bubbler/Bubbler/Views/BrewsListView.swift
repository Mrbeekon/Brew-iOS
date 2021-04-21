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
    
    func delete(at offsets: IndexSet) {
        print("delete")
    }
    
    var body: some View {
        ScrollView {
            ForEach(brews) { brew in
                Spacer()
                BrewView(brew: brew, isExpanded: self.selection.contains(brew))
                    .onTapGesture { self.selectDeselect(brew) }
                    .animation(.linear(duration: 0.3))
                Spacer()
            }
        }
        
    }
    
    func selectDeselect(_ brew: BrewEntity) {
        print("Selected \(brew.id)")
        if selection.contains(brew) {
            selection.remove(brew)
        } else {
            selection.insert(brew)
        }
    }
}
