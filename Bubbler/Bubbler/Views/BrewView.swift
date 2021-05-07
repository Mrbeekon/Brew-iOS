//
//  BrewView.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//  With help from: https://www.vadimbulavin.com/expand-and-collapse-list-with-animation-in-swiftui/
//

// View for a brew item on the main page

import SwiftUI
import SwiftUICharts

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
                VStack {
                    if brew.readings.isEmpty{
                        Text("No data yet, add some readings!")
                    } else {
                        LineChartView(data: brew.graphValues(), title: "Gravity", legend: "Over time", form: ChartForm.extraLarge, rateValue: nil, dropShadow: false, valueSpecifier: "%.3f") // from SwiftUICharts
                    }
                    HStack{
                        Button("Alerts") {
                            showAlertsSheet = true
                        }
                            .buttonStyle(AlertsButton())
                            .sheet(isPresented: $showAlertsSheet) {
                                NotificationSheetView(brew: brew)
                                }
                        
                        Button(action: {
                            brew.sortReadings()
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

