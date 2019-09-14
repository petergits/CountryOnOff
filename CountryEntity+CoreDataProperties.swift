//
//  CountryEntity+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension CountryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: "CountryEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var topLevelDomain: String?
    @NSManaged public var flag: String?
    @NSManaged public var alpha2Code: String?
    @NSManaged public var alpha3Code: String?
    @NSManaged public var capital: String?
    @NSManaged public var altSpellings: String?
    @NSManaged public var region: String?
    @NSManaged public var subregion: String?
    @NSManaged public var population: Double
    @NSManaged public var latlng: String?
    @NSManaged public var demonym: String?
    @NSManaged public var area: Double
    @NSManaged public var gini: Float
    @NSManaged public var nativeName: String?
    @NSManaged public var numericCode: String?
    @NSManaged public var flagImage: NSData?
    @NSManaged public var cioc: String?
    @NSManaged public var storedOffline: Bool
    @NSManaged public var borders: NSSet?
    @NSManaged public var gps: CountryLatLongEntity?
    @NSManaged public var altSpelling: NSSet?
    @NSManaged public var callingCodes: NSSet?
    @NSManaged public var currencies: NSSet?
    @NSManaged public var languages: NSSet?
    @NSManaged public var regionalBlocks: NSSet?
    @NSManaged public var timeZones: NSSet?
    @NSManaged public var translations: NSSet?

}

// MARK: Generated accessors for borders
extension CountryEntity {

    @objc(addBordersObject:)
    @NSManaged public func addToBorders(_ value: BordersEntity)

    @objc(removeBordersObject:)
    @NSManaged public func removeFromBorders(_ value: BordersEntity)

    @objc(addBorders:)
    @NSManaged public func addToBorders(_ values: NSSet)

    @objc(removeBorders:)
    @NSManaged public func removeFromBorders(_ values: NSSet)

}

// MARK: Generated accessors for altSpelling
extension CountryEntity {

    @objc(addAltSpellingObject:)
    @NSManaged public func addToAltSpelling(_ value: AlternateSpellingEntity)

    @objc(removeAltSpellingObject:)
    @NSManaged public func removeFromAltSpelling(_ value: AlternateSpellingEntity)

    @objc(addAltSpelling:)
    @NSManaged public func addToAltSpelling(_ values: NSSet)

    @objc(removeAltSpelling:)
    @NSManaged public func removeFromAltSpelling(_ values: NSSet)

}

// MARK: Generated accessors for callingCodes
extension CountryEntity {

    @objc(addCallingCodesObject:)
    @NSManaged public func addToCallingCodes(_ value: CallingCodesEntity)

    @objc(removeCallingCodesObject:)
    @NSManaged public func removeFromCallingCodes(_ value: CallingCodesEntity)

    @objc(addCallingCodes:)
    @NSManaged public func addToCallingCodes(_ values: NSSet)

    @objc(removeCallingCodes:)
    @NSManaged public func removeFromCallingCodes(_ values: NSSet)

}

// MARK: Generated accessors for currencies
extension CountryEntity {

    @objc(addCurrenciesObject:)
    @NSManaged public func addToCurrencies(_ value: CurrenciesEntity)

    @objc(removeCurrenciesObject:)
    @NSManaged public func removeFromCurrencies(_ value: CurrenciesEntity)

    @objc(addCurrencies:)
    @NSManaged public func addToCurrencies(_ values: NSSet)

    @objc(removeCurrencies:)
    @NSManaged public func removeFromCurrencies(_ values: NSSet)

}

// MARK: Generated accessors for languages
extension CountryEntity {

    @objc(addLanguagesObject:)
    @NSManaged public func addToLanguages(_ value: LanguagesEntity)

    @objc(removeLanguagesObject:)
    @NSManaged public func removeFromLanguages(_ value: LanguagesEntity)

    @objc(addLanguages:)
    @NSManaged public func addToLanguages(_ values: NSSet)

    @objc(removeLanguages:)
    @NSManaged public func removeFromLanguages(_ values: NSSet)

}

// MARK: Generated accessors for regionalBlocks
extension CountryEntity {

    @objc(addRegionalBlocksObject:)
    @NSManaged public func addToRegionalBlocks(_ value: RegionalBlocksEntity)

    @objc(removeRegionalBlocksObject:)
    @NSManaged public func removeFromRegionalBlocks(_ value: RegionalBlocksEntity)

    @objc(addRegionalBlocks:)
    @NSManaged public func addToRegionalBlocks(_ values: NSSet)

    @objc(removeRegionalBlocks:)
    @NSManaged public func removeFromRegionalBlocks(_ values: NSSet)

}

// MARK: Generated accessors for timeZones
extension CountryEntity {

    @objc(addTimeZonesObject:)
    @NSManaged public func addToTimeZones(_ value: TimezonesEntity)

    @objc(removeTimeZonesObject:)
    @NSManaged public func removeFromTimeZones(_ value: TimezonesEntity)

    @objc(addTimeZones:)
    @NSManaged public func addToTimeZones(_ values: NSSet)

    @objc(removeTimeZones:)
    @NSManaged public func removeFromTimeZones(_ values: NSSet)

}

// MARK: Generated accessors for translations
extension CountryEntity {

    @objc(addTranslationsObject:)
    @NSManaged public func addToTranslations(_ value: TransalationsEntity)

    @objc(removeTranslationsObject:)
    @NSManaged public func removeFromTranslations(_ value: TransalationsEntity)

    @objc(addTranslations:)
    @NSManaged public func addToTranslations(_ values: NSSet)

    @objc(removeTranslations:)
    @NSManaged public func removeFromTranslations(_ values: NSSet)

}
