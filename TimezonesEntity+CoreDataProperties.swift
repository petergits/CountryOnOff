//
//  TimezonesEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension TimezonesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimezonesEntity> {
        return NSFetchRequest<TimezonesEntity>(entityName: "TimezonesEntity")
    }

    @NSManaged public var timezone: String
    @NSManaged public var country: CountryEntity

}
