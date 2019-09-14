//
//  UserDeviceDetails+CoreDataProperties.swift
//  
//
//  Created by Peter Adient Gits on 9/14/19.
//
//

import Foundation
import CoreData


extension UserDeviceDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDeviceDetails> {
        return NSFetchRequest<UserDeviceDetails>(entityName: "UserDeviceDetailsEntity")
    }

    @NSManaged public var access_token: String?
    @NSManaged public var access_tokenDateExpires: NSDate?
    @NSManaged public var authenticatedPhoneNumber: String?
    @NSManaged public var countryName: String?
    @NSManaged public var deviceName: String?
    @NSManaged public var digitsAuthToken: String?
    @NSManaged public var digitsAuthTokenSecret: String?
    @NSManaged public var emailID: String?
    @NSManaged public var firstName: String?
    @NSManaged public var globalID: String?
    @NSManaged public var hashedUserID: String?
    @NSManaged public var iDigitsCounter: Int16
    @NSManaged public var iDigitsInterval: Int16
    @NSManaged public var iFingerprintCounter: Int16
    @NSManaged public var iFingerprintInterval: Int16
    @NSManaged public var lastName: String?
    @NSManaged public var offLineMode: Bool
    @NSManaged public var otherFirewallCredential: String?
    @NSManaged public var otherFirewallCredentialExpires: NSDate?
    @NSManaged public var phoneNumberOnFile: String?
    @NSManaged public var refresh_token: String?
    @NSManaged public var refreshHost: String?
    @NSManaged public var refreshPath: String?
    @NSManaged public var role: String?
    @NSManaged public var siteMinderDateExpires: NSDate?
    @NSManaged public var siteMinderToken: String?
    @NSManaged public var systemName: String?
    @NSManaged public var systemVersion: String?
    @NSManaged public var uidid: String?
    @NSManaged public var userID: String?

}
