//
//  Styles.swift
//  Bubbler
//
//  Created by Sam Kirk on 20/04/2021.
//

import SwiftUI

// Buttons

struct AlertsButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.bottleGreen)
            .cornerRadius(5)
            .animation(.easeOut(duration: 0.2))
            .shadow(radius: 2, x: 0, y: 3)
    }
}

struct ReadingsButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
            .shadow(radius: 2, x: 0, y: 3)
    }
}
