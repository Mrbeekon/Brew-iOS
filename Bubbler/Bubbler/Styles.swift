//
//  Styles.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

extension UIColor {
    static let offWhite = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let backgroundFoam = UIColor(red: 0xFF, green: 0xF3, blue: 0xB3)
    /*static let foam2 = UIColor(red: 0.965, green: 0.965, blue: 0.89)
    static let beerAmber = UIColor(red: 0.942, green: 0.717, blue: 0.271)
    static let bottleGreen = UIColor(red: 0.222, green: 0.587, blue: 0.108)
    static let bottleBrown = UIColor(red: 0.621, green: 0.372, blue: 0)*/
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let foam = Color(red: 0.965, green: 0.965, blue: 0.89)
    static let beerAmber = Color(red: 0.942, green: 0.717, blue: 0.271)
    static let bottleGreen = Color(red: 0.222, green: 0.587, blue: 0.108)
    static let bottleBrown = Color(red: 0.621, green: 0.372, blue: 0)
}

// Buttons
struct AddButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(20)
            .shadow(radius: 2, x: 0, y: 3)
            
    }
}

struct AlertsButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.bottleBrown)
            .cornerRadius(20)
            //.shadow(radius: 2, x: 0, y: 3)
            
    }
}

struct ReadingsButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.bottleGreen)
            .cornerRadius(20)
            //.shadow(radius: 2, x: 0, y: 3)
            
    }
}

struct HiddenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .black)
            //.shadow(radius: 2, x: 0, y: 3)
            
    }
}
