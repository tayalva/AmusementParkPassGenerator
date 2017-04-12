//
//  Entrants.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


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

protocol EntrantInfo {
    
    var firstName: String { get }
    var lastName: String { get }
    var address: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
    var DOB: String { get }
    
}

protocol Worker {
    
    
}

protocol Discount {
    
    var foodDiscount: Double { get }
    var merchDiscount: Double { get }
}

class Guest: EntrantInfo, Discount {
    
   

    let firstName: String
    let lastName: String
    let address: String
    let city: String
    let state: String
    let zipCode: Int
    let DOB: String
    let guestType: GuestType
    var areaAccess: [EntrantAccess]
    var foodDiscount: Double
    var merchDiscount: Double

    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: Int, DOB: String, guestType: GuestType, areaAccess: EntrantAccess){
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.DOB = DOB
        self.guestType = guestType
        
        
        switch guestType {
            
        case .classic:
            
            self.areaAccess = [EntrantAccess.amusementArea]
            foodDiscount = 0.0
            merchDiscount = 0.0
            
        case .child:
            
            self.areaAccess = [EntrantAccess.amusementArea]
            foodDiscount = 0.0
            merchDiscount = 0.0
            
            
        case .vip:
            self.areaAccess = [EntrantAccess.amusementArea]
            foodDiscount = 0.10
            merchDiscount = 0.20
            
    
    }
    
    }
}

class Employee: EntrantInfo, Discount {
    
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: Int
    var DOB: String
    let areaAccess: [EntrantAccess]
    let type: EmployeeType
    var foodDiscount: Double
    var merchDiscount: Double

    
    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: Int, DOB: String, type: EmployeeType, areaAccess: EntrantAccess, foodDiscount: Double, merchDiscount: Double){
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.DOB = DOB
 
        switch type {
        case .foodServices:
            self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.kitchenArea]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
        case .rideServices:
            self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.rideControl]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
        case .maintenance:
            self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.kitchenArea, EntrantAccess.rideControl, EntrantAccess.maintenance]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
        case .manager:
            self.areaAccess = EntrantAccess.allAreas
            self.foodDiscount = 0.25
            self.merchDiscount = 0.25
    
        }
        
        
    }
}

