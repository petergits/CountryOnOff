//
//  TransalationsEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension TransalationsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransalationsEntity> {
        return NSFetchRequest<TransalationsEntity>(entityName: "TransalationsEntity")
    }

    @NSManaged public var code: String?
    @NSManaged public var translation: String?
    @NSManaged public var country: CountryEntity

}
