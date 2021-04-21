//
//  Brew.swift
//  Brew Class

import SwiftUI

struct Brew: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var abv: String
    var og: String
    var sg: String
    var fg: String
}
