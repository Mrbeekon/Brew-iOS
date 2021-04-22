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
    
    var body: some View {
        GeometryReader { metrics in }
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
                            
                            NavigationLink(destination: ReadingsView(brew: brew)) {
                                Text("Readings")
                                
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.bottleGreen)
                                //.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(20)
                            }
                        }
                    }
                }
            }
            .frame(width: 350, height:60, alignment: .topLeading)
            .background(Color.foam.mask(RoundedRectangle(cornerRadius: 20)))
            
            .frame(width: 350, height:150, alignment: .topLeading)
            .background(Color.beerAmber.mask(RoundedRectangle(cornerRadius: 20)).shadow(radius: 2, x: 0, y: 3))
            
            .background(Color.secondary.opacity(0.0))
            .offset(self.offset)
            .animation(.spring())
            .gesture(DragGesture()
                        .onChanged { gesture in
                            self.offset.width = gesture.translation.width
                        }
                        .onEnded { _ in
                            if self.offset.width < -50 {
                                self.scale = 1
                                self.offset.width = -60
                            } else {
                                self.scale = 0.5
                                self.offset = .zero
                            }
                        })
        
    }
}

/*
struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
    }
}
*/
