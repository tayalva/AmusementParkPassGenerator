//
//  Guests.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/13/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

class Guest: Visitor, Discount {
    

    let age: Int?
    let type: GuestType
    let areaAccess: [EntrantAccess]
    let foodDiscount: Double
    let merchDiscount: Double
    let frontOfLinePass: Bool
    
    
    init(type: GuestType, age: Int?) throws {
        
        self.age = age
        self.type = type
        
        
        
        switch type {
            
        case .classic:
           
            self.areaAccess = [EntrantAccess.amusementArea]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            self.frontOfLinePass = false
            
        case .child:
            
            self.areaAccess = [EntrantAccess.amusementArea]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            self.frontOfLinePass = false
            
            
        case .vip:
            self.areaAccess = [EntrantAccess.amusementArea]
            self.frontOfLinePass = true
            self.foodDiscount = 0.10
            self.merchDiscount = 0.20
            
            
        }
        
    }
}
