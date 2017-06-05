//
//  Employees.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/13/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


class Employee: Discount {
    
    let firstName: String?
    let lastName: String?
    let birthday: String?
    let address: String?
    let city: String?
    let state: String?
    let zip: String?
    let areaAccess: [EntrantAccess]
    let foodDiscount: Double
    let merchDiscount: Double
    let type: EmployeeType
    let projectNumber: String?
    
    
    
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zip: String?, birthday: String?, employeeType: EmployeeType, projectNumber: String?) throws {
        
        guard projectNumber != "" else { throw UserError.missingProjectNumber }
        
        guard let firstName = firstName, let lastName = lastName else { throw UserError.missingFullName }
        guard firstName != "", lastName != "" else { throw UserError.missingFullName }
        
        guard let address = address, let city = city, let state = state else { throw UserError.missingFullAddress }
        guard address != "", city != "", state != "", zip != "" else { throw UserError.missingFullAddress }
        
        guard zip != nil else { throw UserError.zipCodeIncorrect }
        
        
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.type = employeeType
        self.projectNumber = projectNumber
        
        
    
// even though this information is also in the PassCreator, I wanted to put it here in case other information need to be store or accessed without a pass
        
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
            self.areaAccess = [EntrantAccess.amusementArea]
            self.foodDiscount = 0.25
            self.merchDiscount = 0.25
            
        case .contract:
            
            
            guard projectNumber != nil else { throw UserError.missingProjectNumber }
            
            switch projectNumber {
                
            case "1001"?:
                
                self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.rideControl]
                
            case "1002"?:
                
                self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.rideControl, EntrantAccess.maintenance]
                
            case "1003"?:
                
                self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.rideControl, EntrantAccess.maintenance, EntrantAccess.kitchenArea, EntrantAccess.office]
                
            case "2001"?:
                
                self.areaAccess = [EntrantAccess.office]
                
            case "2002"?:
                
                self.areaAccess = [EntrantAccess.kitchenArea, EntrantAccess.maintenance]
                
            default:
                
                throw UserError.wrongProjectNumber
            }
            
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            
        }
        
    }
    
}
