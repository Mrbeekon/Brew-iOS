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
    let brew: Brew
    
    let isExpanded: Bool
    
    var body: some View {
        content
    }
    
    @State private var showingSheet = false
    
    private var content: some View {
        ZStack(alignment: .center)  {
            HStack() {
                Text(brew.name)
                Spacer()
                Text(brew.abv)
                    .font(.subheadline)
            }
            .frame(width: 375, height:60, alignment: .topLeading)
            .background(Color.foam.mask(RoundedRectangle(cornerRadius: 20)))
            
            .frame(width: 375, height:150, alignment: .topLeading)
            .background(Color.beerAmber.mask(RoundedRectangle(cornerRadius: 20)).shadow(radius: 2, x: 0, y: 3))
            
            if isExpanded {
                VStack{
                    Text("OG: " + brew.og)
                    Text("SG: " + brew.sg)
                    Text("info")
                    HStack{
                        Button("Alerts") {
                            showingSheet = true
                        }
                            .buttonStyle(AlertsButton())
                            .actionSheet(isPresented: $showingSheet) {
                                    ActionSheet(
                                        title: Text("What do you want to do?"),
                                        message: Text("There's only one choice..."),
                                        buttons: [.default(Text("Dismiss Action Sheet"))]
                                    )
                                }
                        
                        NavigationLink(destination: ReadingsView()) {
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
    }
}

/*
struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
    }
}
*/
