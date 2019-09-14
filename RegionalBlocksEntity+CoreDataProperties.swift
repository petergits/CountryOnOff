//
//  RegionalBlocksEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension RegionalBlocksEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RegionalBlocksEntity> {
        return NSFetchRequest<RegionalBlocksEntity>(entityName: "RegionalBlocksEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var regionBlocksName: String?
    @NSManaged public var country: CountryEntity?

}
