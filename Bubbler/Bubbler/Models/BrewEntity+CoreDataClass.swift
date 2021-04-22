//
//  BrewEntity+CoreDataClass.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//
//

import Foundation
import CoreData

@objc(BrewEntity)
public class BrewEntity: NSManagedObject {
    func calculateABV2(og: Double, fg: Double) -> Double {
        var abv: Double
        abv = (og - fg)*131.25
        return abv
    }
    
    func calculateAbv(){
        var og: Double
        var sg: Double
        //sort dictionary by date
        
        
        og = Double(self.readings[] = "")
        sg = Double(self.readings[] = "")
        
    }
 
    func setAbv(){
        self.abv = "5.5"
    }
}
