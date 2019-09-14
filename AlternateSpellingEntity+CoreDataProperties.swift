//
//  AlternateSpellingEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension AlternateSpellingEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlternateSpellingEntity> {
        return NSFetchRequest<AlternateSpellingEntity>(entityName: "AlternateSpellingEntity")
    }

    @NSManaged public var altSpell: String
    @NSManaged public var country: CountryEntity

}
