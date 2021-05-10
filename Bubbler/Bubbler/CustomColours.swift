//
//  CustomColours.swift
//  Bubbler
//
//  Created by Sam Kirk on 09/05/2021.
//

import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }

    static let offWhite = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let foam = UIColor(red: 0xF6, green: 0xF6, blue: 0xE5)
    static let offBlack = UIColor(red: 0x3A, green: 0x3A, blue: 0x3C)
}

extension Color {
    public init(toDecimalRGB red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var lightGold: Color {
        return Color(toDecimalRGB: 255, green: 241, blue: 114)
    }
    
    public static var darkGold: Color {
        return Color(toDecimalRGB: 223, green: 175, blue: 55)
    }
    
    public static var lighterGold: Color {
        return Color(toDecimalRGB: 255, green: 257, blue: 176)
    }
    
    public static var darkerGold: Color {
        return Color(toDecimalRGB: 194, green: 143, blue: 15)
    }
    public static var darkerGold2: Color {
        return Color(toDecimalRGB: 81, green: 59, blue: 5)
    }
    
    public static var offBlack: Color {
        return Color(toDecimalRGB: 58, green: 58, blue: 60)
    }
    
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let foam = Color(red: 0.965, green: 0.965, blue: 0.89)
    static let beer = Color(red: 0.942, green: 0.717, blue: 0.271)
    static let bottleGreen = Color(red: 0.222, green: 0.587, blue: 0.108)
    static let bottleBrown = Color(red: 0.621, green: 0.372, blue: 0)
}
    
