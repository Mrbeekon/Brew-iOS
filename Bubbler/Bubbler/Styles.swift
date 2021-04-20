//
//  Styles.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

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
