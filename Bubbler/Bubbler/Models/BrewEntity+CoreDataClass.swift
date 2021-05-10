//
//  BrewEntity+CoreDataClass.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//
//

import Foundation
import CoreData
import CoreGraphics

@objc(BrewEntity)
public class BrewEntity: NSManagedObject {
    let formatter = DateFormatter()
    let dateFormatString = "d d-MM-y"
    
    func getOG() -> String {
        var og: String
        
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        
        //get first and last values then string to double
        og = sortedReadings.first?.value ?? "-"
        return og
    }
    
    func getFG() -> String {
        var fg: String
        //sort dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        
        //get first and last values then string to double
        fg = sortedReadings.last?.value ?? "-"
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
    
    func calculateAbv(){
        var og: Double
        var fg: Double
        //make sure using sorted dictionary by date
        let sortedReadings = Array(self.readings.sorted(by: <))
        
        //get first and last values then string to double
        og = ((sortedReadings.first?.value ?? "0.0") as NSString).doubleValue
        fg = ((sortedReadings.last?.value ?? "0.0") as NSString).doubleValue
        
        //abv calculation
        self.abv = String(format: "%.2f", (og - fg)*131.25)
    }
    
    //adds a sanitised reading to the brew
    func addReading(readingDate: Date, readingValue: String){
        //only one decimal allowed in string
        var cleanReadingValue = readingValue
        if cleanReadingValue.contains(".") {
            let splitted = cleanReadingValue.split(separator: ".")
            if splitted.count >= 2 {
                let preDecimal = String(splitted[0])
                let afterDecimal = String(splitted[1])
                cleanReadingValue = "\(preDecimal).\(afterDecimal)"
            }
        }
        //should be 3dp as is standard
        cleanReadingValue = String(format: "%.3f", ((cleanReadingValue) as NSString).doubleValue)
        self.readings[readingDate] = cleanReadingValue
        self.sortReadings()
    }
    
    func sortReadings() {
        var newDict:[Date:String] = [:]
        for tuple in self.readings.sorted(by: <) {
            newDict[tuple.key] = tuple.value
        }
        self.readings = newDict
    }
    
    func graphValues() -> [Double] {
        return  (self.readings.values.map {
           ($0 as NSString).doubleValue
        }).sorted().reversed()
    }
}
