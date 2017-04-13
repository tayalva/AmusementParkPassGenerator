//
//  Employees.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/13/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


class Employee: Worker, Discount {
    
    let firstName: String
    let lastName: String
    let address: String
    let city: String
    let state: String
    let zip: Int
    let areaAccess: [EntrantAccess]
    let foodDiscount: Double
    let merchDiscount: Double
    let type: EmployeeType
    
    
    
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zip: Int?) throws {
        
        guard let firstName = firstName, let lastName = lastName else { throw UserError.missingFullName }
        
        
        guard let address = address, let city = city, let state = state, let zip = zip else { throw UserError.missingFullAddress }
        
    
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.type = .foodServices
       
        
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
