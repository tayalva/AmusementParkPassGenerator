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
    
   static let allAreas = [amusementArea, kitchenArea, rideControl, maintenance, office]
}

enum RideAccess: String {
    
    case accessAllRides = "Ride Access: All"
    case frontOfLinePass = "VIP Front Of The Line Pass"
    
}

enum GuestType {
    
    case classic
    case vip
    case child
    
}

enum EmployeeType {
    
    case foodServices
    case rideServices
    case maintenance
    case manager
    
}

enum EntrantType: String {
    
    case classicGuestPass = "Classic Guest Pass"
    case childGuestPass = "Child Guest Pass"
    case vipGuestPass = "VIP Guest Pass"
    case employeeFoodServicePass = "Food Service Employee Pass"
    case employeeRideServicePass = "Ride Service Employee Pass"
    case employeeMaintenancePass = "Maintenance Employee Pass"
    case employeeManagerPass = "Manager Employee Pass"
    
}

enum UserError: Error {
    
    case missingFullName
    case missingFullAddress
    case missingBirthday
    case guestIsOlderThan5

}

//protocols for conformation

protocol Worker {
    
    var firstName: String { get }
    var lastName: String { get }
    var address: String { get }
    var city: String { get }
    var state: String { get }
    var zip: Int { get }
    
}

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





