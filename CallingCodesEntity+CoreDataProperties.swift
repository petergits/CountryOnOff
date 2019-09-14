//
//  CallingCodesEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension CallingCodesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CallingCodesEntity> {
        return NSFetchRequest<CallingCodesEntity>(entityName: "CallingCodesEntity")
    }

    @NSManaged public var code: String
    @NSManaged public var country: CountryEntity

}
