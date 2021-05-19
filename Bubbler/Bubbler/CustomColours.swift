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
    
    public static var offBlack: Color {
        return Color(toDecimalRGB: 58, green: 58, blue: 60)
    }
    
    public static var offWhite: Color {
        return Color(toDecimalRGB: 225, green: 225, blue: 235)
    }
    
    public static var foam: Color {
        return Color(toDecimalRGB: 246, green: 246, blue: 229)
    }
    
    public static var beer: Color {
        return Color(toDecimalRGB: 240, green: 183, blue: 69)
    }
    
    public static var bottleGreen: Color {
        return Color(toDecimalRGB: 57, green: 150, blue: 28)
    }
}
    
