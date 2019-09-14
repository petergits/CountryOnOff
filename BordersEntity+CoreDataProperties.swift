//
//  BordersEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension BordersEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BordersEntity> {
        return NSFetchRequest<BordersEntity>(entityName: "BordersEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var borders: String?
    @NSManaged public var country: CountryEntity

}
