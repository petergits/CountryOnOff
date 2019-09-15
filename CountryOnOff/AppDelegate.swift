//
//  AppDelegate.swift
//  CountryOnOff
//
//  Created by Peter Gits on 9/11/19.
//  Copyright © 2019 GeekGaps. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var myCoreDataManager: CoreDataManager = CoreDataManager()
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        return urls[urls.count-1]
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //this copies the populated embedded database if it doesn't already exist
        //        self.myCoreDataManager.preloadDBData()
        
        // Sets background to a blank/empty image
        //        Fabric.with([Crashlytics.self, Digits.self])
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.white]
        
        //Mark:  hide navigation bar button "back"
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for:UIBarMetrics.default)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack
/*
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if userActivity.activityType == CSSearchableItemActionType {
            if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
                if let navigationController = window?.rootViewController as? UINavigationController {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                }
            }
        }
        return true
    }
 */
    func getManagedContext() -> NSManagedObjectContext {
        return self.myCoreDataManager.persistentContainer.viewContext
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CountryStore")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchedCountries() ->[CountryEntity] {
        let moc = self.getManagedContext()
        let countriesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CountryEntity")
        var myFetchedCountries:[CountryEntity]
        do {
            myFetchedCountries = try moc.fetch(countriesFetch) as! [CountryEntity]
        } catch {
            fatalError("Failed to fetch any countries: \(error)")
        }
        return myFetchedCountries
    }

    public func createCountries()->Void {
        if self.fetchedCountries().count > 0 {
            return;
        }
        let managedContext = self.getManagedContext()
        self.importCountries()
        self.saveContext()
        return
    }
    
    public func importCountries()->Void {
        let countryFetch = self.fetchedCountries()
        var countries : CountryEntity? = nil
        if countryFetch != nil {
            countries = countryFetch[0]
        }
        
        let jsonCountriesName:String = String("countries")
        let jsonCountriesPath: String = Bundle.main.path(forResource: jsonCountriesName, ofType: "json")! as String
        
        let readData : Data = try! Data(contentsOf: URL(fileURLWithPath: jsonCountriesPath), options:  NSData.ReadingOptions.dataReadingMapped)
        do {
            let countriesDictionary = try JSONSerialization.jsonObject(with: readData, options: [])
                as! [String : AnyObject]
            print(countriesDictionary)

            let countryEntity:CountryEntity = NSEntityDescription.insertNewObject(forEntityName: "CountryEntity", into: self.getManagedContext()) as! CountryEntity

            //iterate over the dictionary
            for(theType,theDetails) in countriesDictionary {
                print("type = \(theType)\n")
                if theType == "name" {
                    print("theDetails = \(theDetails)\n")
                    countryEntity.name         = theDetails["name"] as? String
                }else if theType == "alpha2Code" {
                    countryEntity.alpha2Code   = theDetails["alpha2code"] as? String
                }else if theType == "alpha3code" {
                    countryEntity.alpha3Code   = theDetails["alpha3code"] as? String
                }else if theType == "capital" {
                    countryEntity.capital      = theDetails["capital"] as? String
                }else if theType == "region" {
                    countryEntity.region       = theDetails["region"] as? String
                }else if theType == "subregion" {
                    countryEntity.subregion    = theDetails["subregion"] as? String
                }else if theType == "population" {
                    countryEntity.population   = theDetails["population"] as? Double ?? 0
                }else if theType == "gini" {
                    countryEntity.gini   = theDetails["gini"] as? Float ?? 0.0
                }else if theType == "demonym" {
                    countryEntity.demonym = theDetails["demonym"] as? String
                }else if theType == "area" {
                    countryEntity.area = theDetails["area"] as? Float ?? 0.0
                }else if theType == "nativeName" {
                    countryEntity.nativeName = theDetails["nativeName"] as? String
                }else if theType == "flag" {
                    countryEntity.flag = theDetails["flag"] as? String
                }else if theType == "numericCode" {
                    countryEntity.numericCode = theDetails["numericCode"] as? String
                }else if theType == "callingCodes" {
                    let codesArray = theDetails["callingCodes"] as! NSArray
                    for arrayElement in codesArray {
                        let callingCodesEntity:CallingCodesEntity = NSEntityDescription.insertNewObject(forEntityName: "CallingCodesEntity", into: self.getManagedContext()) as! CallingCodesEntity
                        callingCodesEntity.code    = arrayElement as? String
                        countryEntity.addToCallingCodes( callingCodesEntity )
                        callingCodesEntity.country = countryEntity
                    }
                }else if theType == "altSpellings" {
                        let codesArray = theDetails["altSpellings"] as! NSArray
                        for arrayElement in codesArray {
                            let alternateSpellingEntity:AlternateSpellingEntity = NSEntityDescription.insertNewObject(forEntityName: "AlternateSpellingEntity", into: self.getManagedContext()) as! AlternateSpellingEntity
                            alternateSpellingEntity.altSpell = arrayElement as? String
                            countryEntity.addToAltSpelling(alternateSpellingEntity)
                            alternateSpellingEntity.country  = countryEntity
                        }
                }else if theType == "latlng" {
                    let codesArray = theDetails["latlng"] as! NSArray
                    
                    let countryLatLongEntity:GpsEntity = NSEntityDescription.insertNewObject(forEntityName: "GpsEntity", into: self.getManagedContext()) as! GpsEntity
                    countryLatLongEntity.latitude = codesArray[0] as? Float ?? 0.0
                    countryLatLongEntity.longitude = codesArray[1] as? Float ?? 0.0
                        countryEntity.gps = countryLatLongEntity
                        countryLatLongEntity.country  = countryEntity
                }else if theType == "timezones" {
                    let codesArray = theDetails["timezones"] as! NSArray
                    for arrayElement in codesArray {
                        let timezonesEntity:TimezonesEntity = NSEntityDescription.insertNewObject(forEntityName: "TimezonesEntity", into: self.getManagedContext()) as! TimezonesEntity
                        timezonesEntity.timezone = arrayElement as? String
                        countryEntity.addToTimeZones(timezonesEntity)
                        timezonesEntity.country   = countryEntity
                    }
                }else if theType == "borders" {
                    let codesArray = theDetails["borders"] as! NSArray
                    for arrayElement in codesArray {
                        let bordersEntity:BordersEntity = NSEntityDescription.insertNewObject(forEntityName: "BordersEntity", into: self.getManagedContext()) as! BordersEntity
                        bordersEntity.borderName = arrayElement as? String
                        countryEntity.addToBorders(bordersEntity)
                        bordersEntity.country   = countryEntity
                    }
                }else if theType == "currencies" {
                    let codesArray = theDetails["currencies"] as! NSArray
                    for arrayElement in codesArray {
                        let currenciesEntity:CurrenciesEntity = NSEntityDescription.insertNewObject(forEntityName: "CurrenciesEntity", into: self.getManagedContext()) as! CurrenciesEntity
                        let myDictionary = arrayElement as! Dictionary<String, AnyObject>
                        currenciesEntity.code = myDictionary["code"] as? String
                        currenciesEntity.name = myDictionary["name"] as? String
                        currenciesEntity.symbol = myDictionary["symbol"] as? String
                        countryEntity.addToCurrencies(currenciesEntity)
                        currenciesEntity.country = countryEntity
                    }
                }else if theType == "languages" {
                    let codesArray = theDetails["languages"] as! NSArray
                    for arrayElement in codesArray {
                        let languagesEntity:LanguagesEntity = NSEntityDescription.insertNewObject(forEntityName: "LanguagesEntity", into: self.getManagedContext()) as! LanguagesEntity
                        let myDictionary = arrayElement as! Dictionary<String, AnyObject>
                        languagesEntity.iso639_1 = myDictionary["iso639_1"] as? String
                        languagesEntity.iso639_2 = myDictionary["iso639_2"] as? String
                        languagesEntity.name = myDictionary["name"] as? String
                        languagesEntity.nativeName = myDictionary["nativeName"] as? String
                        countryEntity.addToLanguages(languagesEntity)
                        languagesEntity.country = countryEntity
                    }
                }else if theType == "translations" {
                    let codesArray = theDetails["translations"] as! NSArray
                    for arrayElement in codesArray {
                        let translationsEntity:TransalationsEntity = NSEntityDescription.insertNewObject(forEntityName: "TranslationsEntity", into: self.getManagedContext()) as! TransalationsEntity
                        let myDictionary = arrayElement as! Dictionary<String, AnyObject>
                        let aCodeKey:String = Array(myDictionary.keys)[0]
                            translationsEntity.code = aCodeKey
                            translationsEntity.translation = myDictionary[aCodeKey] as? String
                        //translationsEntity.de = myDictionary["de"] as? String
                        //translationsEntity.es = myDictionary["es"] as? String
                        //translationsEntity.fr = myDictionary["fr"] as? String
                        //translationsEntity.ja = myDictionary["ja"] as? String
                        //translationsEntity.it = myDictionary["it"] as? String
                        //translationsEntity.br = myDictionary["br"] as? String
                        //translationsEntity.pt = myDictionary["pt"] as? String
                        //translationsEntity.nl = myDictionary["nl"] as? String
                        //translationsEntity.hr = myDictionary["hr"] as? String
                        //translationsEntity.fa = myDictionary["fa"] as? String
                        countryEntity.addToTranslations(translationsEntity)
                        translationsEntity.country = countryEntity
                }
               }else if theType == "regionalBlocs" {
                    let codesArray = theDetails["translations"] as! NSArray
                    for arrayElement in codesArray {
                       let regionalBlocksEntity:RegionalBlocksEntity = NSEntityDescription.insertNewObject(forEntityName: "RegionalBlocksEntity", into: self.getManagedContext()) as! RegionalBlocksEntity
                        let myDictionary = arrayElement as! Dictionary<String, AnyObject>
                        regionalBlocksEntity.regionalBlockName = myDictionary["acronym"] as? String
                        regionalBlocksEntity.name = myDictionary["name"] as? String
                        countryEntity.addToRegionalBlocks(regionalBlocksEntity)
                        regionalBlocksEntity.country = countryEntity
                    }
                }
            }//end of the for loop
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        print("finished")
        self.saveContext()
    }

}

extension Data {
    var string: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
extension String {
    var data: Data {
        return Data(utf8)
    }
    var base64Decoded: Data? {
        return Data(base64Encoded: self)
    }
}




