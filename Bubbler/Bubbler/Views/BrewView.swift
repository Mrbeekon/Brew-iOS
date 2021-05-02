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
    
    @State var graphOn = true
    
    var body: some View {
        //GeometryReader { metrics in }
        VStack  {
            HStack() {
                Text(brew.name)
                Spacer()
                Text(brew.abv ?? "-")
                    .font(.subheadline)
            }
            
            HStack{
                Text("Start Date: ") + Text(brew.getStartDate()) //get from dictionary
                Spacer()
                Text("OG: ") + Text(brew.getOG()) //get from dictionary
                
            }
            HStack{
                Text("End Date: ") + Text(brew.getEndDate()) //get from dictionary
                Spacer()
                Text("FG: ") + Text(brew.getFG()) //get from dictionary
            }
            
            if isExpanded {
                VStack{
                    LineGraphShape(dataPoints: [0.8, 0.5, 0.3, 0.2, 0.1])
                        .trim(to: graphOn ? 1 : 0)
                        .stroke(Color.red, lineWidth: 2)
                        .aspectRatio(16/9, contentMode: .fit)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .padding()
                    }
                    HStack{
                        Button("Alerts") {
                            showAlertsSheet = true
                        }
                            .buttonStyle(AlertsButton())
                            .sheet(isPresented: $showAlertsSheet) {
                                AlertsSheetView(brew: brew)
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



/*
struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
    }
}
*/
