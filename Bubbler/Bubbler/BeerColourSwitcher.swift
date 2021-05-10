//
//  SwiftUIView.swift
//  Bubbler
//
//  Created by Sam Kirk on 09/05/2021.
//
//  These functions take the brewName as a string and uses it to return a colour that mathces the typical brew colour

import SwiftUI

extension Color {
    public static var light: Color {
        return Color(toDecimalRGB: 248, green: 218, blue: 126)
    }
    public static var helles: Color {
        return Color(toDecimalRGB: 236, green: 180, blue: 66)
    }
    public static var lager: Color {
        return Color(toDecimalRGB: 242, green: 210, blue: 71)
    }
    public static var pilsner: Color {
        return Color(toDecimalRGB: 205, green: 150, blue: 53)
    }
    public static var pale: Color {
        return Color(toDecimalRGB: 227, green: 176, blue: 61)
    }
    public static var hefe: Color {
        return Color(toDecimalRGB: 241, green: 147, blue: 55)
    }
    public static var ipa: Color {
        return Color(toDecimalRGB: 220, green: 151, blue: 56)
    }
    public static var amber: Color {
        return Color(toDecimalRGB: 131, green: 25, blue: 28)
    }
    public static var red: Color {
        return Color(toDecimalRGB: 149, green: 29, blue: 19)
    }
    public static var brown: Color {
        return Color(toDecimalRGB: 79, green: 46, blue: 39)
    }
    public static var porter: Color {
        return Color(toDecimalRGB: 25, green: 8, blue: 3)
    }
    public static var stout: Color {
        return Color(toDecimalRGB: 19, green: 18, blue: 13)
    }
    public static var mede: Color {
        return Color(toDecimalRGB: 236, green: 180, blue: 66)
    }
    public static var cider: Color {
        return Color(toDecimalRGB: 242, green: 164, blue: 59)
    }
}

func BeerColourSwitcher(brewName: String) -> Color {
    let lowerCaseBrewName = brewName.lowercased()
    if lowerCaseBrewName.contains("light"){
        return Color.light
    } else if lowerCaseBrewName.contains("helles"){
        return Color.helles
    } else if lowerCaseBrewName.contains("lager"){
        return Color.lager
    } else if lowerCaseBrewName.contains("pilsner"){
        return Color.pilsner
    } else if lowerCaseBrewName.contains("pale"){
        return Color.pale
    } else if lowerCaseBrewName.contains("hefe"){
        return Color.hefe
    } else if lowerCaseBrewName.contains("ipa") || lowerCaseBrewName.contains("i.p.a"){
        return Color.ipa
    } else if lowerCaseBrewName.contains("amber"){
        return Color.amber
    } else if lowerCaseBrewName.contains("red"){
        return Color.red
    } else if lowerCaseBrewName.contains("brown"){
        return Color.brown
    } else if lowerCaseBrewName.contains("porter"){
        return Color.porter
    } else if lowerCaseBrewName.contains("stout"){
        return Color.stout
    } else if lowerCaseBrewName.contains("mede"){
        return Color.mede
    } else if lowerCaseBrewName.contains("cider") || lowerCaseBrewName.contains("cidre"){
        return Color.cider
    } else {
        return Color.beer
    }
}

// Dark colours need a light font and vice versa
func FontColourSwitcher(brewName: String) -> Color {
    let lowerCaseBrewName = brewName.lowercased()
    if lowerCaseBrewName.contains("amber") || lowerCaseBrewName.contains("red") || lowerCaseBrewName.contains("brown") || lowerCaseBrewName.contains("porter") || lowerCaseBrewName.contains("stout"){
        return Color.foam
    } else {
        return Color.offBlack
    }
}



