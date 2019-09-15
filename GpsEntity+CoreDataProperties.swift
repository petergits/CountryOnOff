//
//  GpsEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Gits on 9/15/19.
//
//

import Foundation
import CoreData


extension GpsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GpsEntity> {
        return NSFetchRequest<GpsEntity>(entityName: "GpsEntity")
    }

    @NSManaged public var lattitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var country: CountryEntity?

}
