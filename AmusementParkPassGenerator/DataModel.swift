//
//  Entrants.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

// Enums for types

enum EntrantAccess: String {
    
    case amusementArea = "Amusement Areas"
    case kitchenArea = "Kitchen Areas"
    case rideControl = "Ride Control Areas"
    case maintenance = "Maintenance Areas"
    case office = "Office Areas"
    
   static let allAreas = [amusementArea.rawValue, kitchenArea.rawValue, rideControl.rawValue, maintenance.rawValue, office.rawValue]
    
}

enum RideAccess: String {
    
    case accessAllRides = "Unlimited Rides"
    case frontOfLinePass = "Front Of The Line Pass"
    
}

enum GuestType {
    
    case classic
    case vip
    case child
    case senior
    case season
    
}

enum EmployeeType {
    
    case foodServices
    case rideServices
    case maintenance
    case manager
    case contract
    
}



enum Vendor: String {
    
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "FedEx"
    case nwElectrical = "NW Electrical"
    
}

enum EntrantType: String {
    
    case classicGuestPass = "Classic Guest Pass"
    case childGuestPass = "Child Guest Pass"
    case vipGuestPass = "VIP Guest Pass"
    case seniorGuestPass = "Senior Guest Pass"
    case seasonGuestPass = "Season Guest Pass"
    case employeeFoodServicePass = "Food Service Employee Pass"
    case employeeRideServicePass = "Ride Service Employee Pass"
    case employeeMaintenancePass = "Maintenance Employee Pass"
    case employeeManagerPass = "Manager Employee Pass"
    case employeeContractPass = "Contract Employee Pass"
    case vendorAcmePass = "Vendor: Acme"
    case vendorOrkinPass = "Vendor: Orkin"
    case vendorFedexPass = "Vendor: FedEx"
    case vendorNwElectrical = "Vendor: NW Electrical"
    
    
}

enum UserError: Error {
    
    case missingFullName
    case missingFullAddress
    case missingBirthday
    case guestIsOlderThan5
    case missingProjectNumber
    case wrongProjectNumber
    case missingDateOfVisit
    case zipCodeIncorrect
    case birthdayIncorrect

}

//protocols for conformation



protocol Visitor {
    var type: GuestType { get }
    
}

protocol AreaAcess {
    
    var areaAcess: EntrantAccess { get }
}

protocol Discount {
    
    var foodDiscount: Double { get }
    var merchDiscount: Double { get }
}





