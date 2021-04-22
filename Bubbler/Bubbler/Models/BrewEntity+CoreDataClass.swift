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
        var fg: Double
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        
        //get first and last values then string to double
        og = ((sortedReadings.first?.value ?? "0.0") as NSString).doubleValue
        fg = ((sortedReadings.last?.value ?? "0.0") as NSString).doubleValue
        
        //abv calculation
        self.abv = String(format: "%.2f", (og - fg)*131.25)
    }
}
