//
//  BrewView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//  With help from: https://www.vadimbulavin.com/expand-and-collapse-list-with-animation-in-swiftui/
//

// View for a brew item on the main page

import SwiftUI

struct BrewView: View {
    
    @State private var showAlertsSheet = false
    @State var tableNumber = ""
    
    @ObservedObject var brew: BrewEntity
    
    let isExpanded: Bool
    
    @State var offset = CGSize.zero
    @State var scale : CGFloat = 0.5
    
    @State var selectedTag: String?
    
    var body: some View {
        //GeometryReader { metrics in }
        VStack  {
            HStack() {
                Text(brew.name)
                Spacer()
                Text(brew.abv ?? "N/A")
                    .font(.subheadline)
            }
            
            HStack{
                Text("OG: ") + Text(brew.getOG()) //get from dictionary
                Text("FG: ") + Text(brew.getFG()) //get from dictionary
            }
            HStack{
                Text("Start Date: ") + Text(brew.getStartDate()) //get from dictionary
                Text("End Date: ") + Text(brew.getEndDate()) //get from dictionary
            }
            
            if isExpanded {
                VStack{
                    HStack{
                        Button("Alerts") {
                            showAlertsSheet = true
                        }
                            .buttonStyle(AlertsButton())
                            .sheet(isPresented: $showAlertsSheet) {
                                    AlertsSheetView()
                                }
                        
                        Button(action: {
                            self.selectedTag = "readings"
                        }, label: {
                            Text("Readings")
                        })
                        .background(
                            NavigationLink(
                                destination: ReadingsView(brew: brew),
                                tag: "readings",
                                selection: $selectedTag,
                                label: { EmptyView()}
                            )
                        )
                        .buttonStyle(ReadingsButton())
                    }
                }
            }
        }
    }
}

/*
struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
    }
}
*/
