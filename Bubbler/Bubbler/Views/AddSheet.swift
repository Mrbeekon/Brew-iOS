//
//  AddSheet.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//

import SwiftUI

struct AddSheet: View {
    var body: some View {
        Text("My Demo View")
              .textFieldAlert(isPresented: $alertIsPresented) { () -> TextFieldAlert in
                TextFieldAlert(title: "Alert Title", message: "Alert Message", text: self.$text)
        }
    }
}
