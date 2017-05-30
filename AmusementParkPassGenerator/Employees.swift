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
    let birthday: String?
    let address: String
    let city: String
    let state: String
    let zip: Int
    let areaAccess: [EntrantAccess]
    let foodDiscount: Double
    let merchDiscount: Double
    let type: EmployeeType
    
    
    
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zip: Int?, birthday: String?, employeeType: EmployeeType) throws {
        
        guard let firstName = firstName, let lastName = lastName else { throw UserError.missingFullName }
        
        
        guard let address = address, let city = city, let state = state, let zip = zip else { throw UserError.missingFullAddress }
        
    
        
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.type = .foodServices
        
 // method to check if it's the entrant's birthday or not
        
        func isTheirBirthday() -> Bool {
            
            guard let birthday = birthday else { return false }
            let myFormatter = DateFormatter()
            let calendar = Calendar.current
            let currentDate = Date()
            myFormatter.dateFormat = "MM/dd/yyyy"
            let formattedBirthday = myFormatter.date(from: birthday)
            let todayComponents = calendar.dateComponents([.month, .day], from: currentDate)
            let birthdayComponents = calendar.dateComponents([.month, .day], from: formattedBirthday!)
            if birthdayComponents.month == todayComponents.month && birthdayComponents.day! == todayComponents.day {
                
                print("Happy Birthday!")
                return true
                
            } else {
                
                print("tis not your birthday")
                return false
            }
            
            
        }
        
        _ = isTheirBirthday() //for some reason it need to call the function again? weird
        
    
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
            self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.kitchenArea]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            
        }
        
    }
}
