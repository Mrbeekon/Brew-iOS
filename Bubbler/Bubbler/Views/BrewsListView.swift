//
//  BrewsListView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

struct BrewsListView: View {
    let brews: [Brew]
    @State private var selection: Set<Brew> = []
    
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
    
    func selectDeselect(_ brew: Brew) {
        print("Selected \(brew.id)")
        if selection.contains(brew) {
            selection.remove(brew)
        } else {
            selection.insert(brew)
        }
    }
}
