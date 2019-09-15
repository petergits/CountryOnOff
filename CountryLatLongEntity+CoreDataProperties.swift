//
//  CountryLatLongEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Gits on 9/15/19.
//
//

import Foundation
import CoreData


extension CountryLatLongEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryLatLongEntity> {
        return NSFetchRequest<CountryLatLongEntity>(entityName: "CountryLatLongEntity")
    }

    @NSManaged public var lattitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var country: CountryEntity?

}
