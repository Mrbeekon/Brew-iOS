//
//  ContentView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/03/2021.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let foam = Color(red: 0.965, green: 0.965, blue: 0.89)
    static let beerAmber = Color(red: 0.942, green: 0.717, blue: 0.271)
    static let bottleGreen = Color(red: 0.222, green: 0.587, blue: 0.108)
    static let bottleBrown = Color(red: 0.621, green: 0.372, blue: 0)
}

let brews = [
    Brew(name: "Hazy IPA", abv: "4.25%", og: "1.050", sg: "1.030", fg: "1.010"),
    Brew(name: "Czech Pils", abv: "4.00%", og: "1.045", sg: "1.020", fg: "1.008"),
    Brew(name: "Absolute Bitter", abv: "8.50%", og: "1.078", sg: "1.0500", fg: "1.010"),
    ]

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Brews")
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button("Add") {}
                        .buttonStyle(AddButton())
                }
                BrewsListView(brews: brews)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
