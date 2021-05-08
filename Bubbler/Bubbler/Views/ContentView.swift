//
//  ContentView.swift
//  Bubbler
//
//  Created by Sam Kirk on 22/03/2021.
//

import SwiftUI
import CoreData

/*let brews = [
    Brew(name: "Hazy IPA", abv: "4.25%", og: "1.050", sg: "1.030", fg: "1.010"),
    Brew(name: "Czech Pils", abv: "4.00%", og: "1.045", sg: "1.020", fg: "1.008"),
    Brew(name: "Absolute Bitter", abv: "8.50%", og: "1.078", sg: "1.0500", fg: "1.010"),
    ]*/

extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color(decimalRed: 46, green: 46, blue: 46)
    }
}

struct ContentView: View {
    @State private var showAddSheet = false
    
    init() {
            UITableView.appearance().backgroundColor = .backgroundFoam // Uses UIColor
    }
    
    var body: some View {
        NavigationView {
            BrewsListView()
                
            .navigationTitle("Brews")
            .toolbar {
                Button("Add") {
                    showAddSheet = true
                }
                .buttonStyle(AddButton())
                .sheet(isPresented: $showAddSheet) {
                        AddSheetView()
                        }
            }
        }
            
    }
}
