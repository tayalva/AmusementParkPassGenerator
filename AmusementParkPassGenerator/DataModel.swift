//
//  Entrants.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

// Enums for types

enum EntrantAccess {
    
    case amusementArea
    case kitchenArea
    case rideControl
    case maintenance
    case office
    
   static let allAreas = [amusementArea, kitchenArea, rideControl, maintenance, office]
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

enum UserError: Error {
    
    case missingFullName
    case missingFullAddress
    case missingBirthday

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




