//
//  TransalationsEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/15/19.
//
//

import Foundation
import CoreData


extension TransalationsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransalationsEntity> {
        return NSFetchRequest<TransalationsEntity>(entityName: "TranslationsEntity")
    }

    @NSManaged public var code: String?
    @NSManaged public var translation: String?
    @NSManaged public var country: CountryEntity?

}
