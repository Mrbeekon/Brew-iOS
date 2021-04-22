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
    let formatter = DateFormatter()
    let dateFormatString = "d-MM-y"
    
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
    
    func getOG() -> String {
        var og: String
        
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        
        //get first and last values then string to double
        og = sortedReadings.first?.value ?? "N/A"
        return og
    }
    
    func getFG() -> String {
        var fg: String
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        
        //get first and last values then string to double
        fg = sortedReadings.last?.value ?? "N/A"
        return fg
    }
    
    func getStartDate() -> String {
        var date: String
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        formatter.dateFormat = dateFormatString
        //get first and last values then string to double
        date = formatter.string(from: sortedReadings.first?.key ?? Date())
        return date
    }
    
    func getEndDate() -> String {
        var date: String
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        formatter.dateFormat = dateFormatString
        //get first and last values then string to double
        date = formatter.string(from: sortedReadings.last?.key ?? Date())
        return date
    }
    
}
