//
//  CurrenciesEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension CurrenciesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrenciesEntity> {
        return NSFetchRequest<CurrenciesEntity>(entityName: "CurrenciesEntity")
    }

    @NSManaged public var code: String?
    @NSManaged public var currencyName: String?
    @NSManaged public var symbol: String?
    @NSManaged public var country: CountryEntity

}
