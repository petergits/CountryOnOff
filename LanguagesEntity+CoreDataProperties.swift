//
//  LanguagesEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension LanguagesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LanguagesEntity> {
        return NSFetchRequest<LanguagesEntity>(entityName: "LanguagesEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var iso639_1: String?
    @NSManaged public var iso639_2: String?
    @NSManaged public var languageName: String?
    @NSManaged public var nativeName: String?
    @NSManaged public var country: CountryEntity?

}
