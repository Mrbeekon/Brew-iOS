//
//  BrewEntity+CoreDataProperties.swift
//  Bubbler
//
//  Created by Sam Kirk on 21/04/2021.
//
//  BrewEntity properties

import Foundation
import CoreData


extension BrewEntity: Identifiable{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BrewEntity> {
        return NSFetchRequest<BrewEntity>(entityName: "BrewEntity")
    }

    @NSManaged public var abv: String?
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var notificationIsSet: Bool
    @NSManaged public var readings: [Date:String]  //[Double] also works

}
