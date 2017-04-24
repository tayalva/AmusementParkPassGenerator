//
//  PassCreator.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/17/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


// Creates the passes for each entrant type, including access, ride access, type, and discounts

class PassCreator: Discount {
    
    var entrantName: String?
    var type: String?
    var areaAccess: [String]
    var rideAccess: [String]
    var foodDiscount: Double
    var merchDiscount: Double
    
    init(entrant: EntrantType) {
        
        switch entrant {
        case .classicGuestPass:
            self.type = EntrantType.classicGuestPass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea.rawValue]
            self.rideAccess = [RideAccess.accessAllRides.rawValue]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            
        case .childGuestPass:
            self.type = EntrantType.childGuestPass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea.rawValue]
            self.rideAccess = [RideAccess.accessAllRides.rawValue]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            
        case .vipGuestPass:
            self.type = EntrantType.vipGuestPass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea.rawValue]
            self.rideAccess = [RideAccess.accessAllRides.rawValue, RideAccess.frontOfLinePass.rawValue]
            self.foodDiscount = 0.10
            self.merchDiscount = 0.20
            
        case .employeeFoodServicePass:
            self.type = EntrantType.employeeFoodServicePass.rawValue
             self.areaAccess = [EntrantAccess.amusementArea.rawValue, EntrantAccess.kitchenArea.rawValue]
             self.rideAccess = [RideAccess.accessAllRides.rawValue]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
            
        case .employeeMaintenancePass:
            self.type = EntrantType.employeeMaintenancePass.rawValue
        self.areaAccess = [EntrantAccess.amusementArea.rawValue, EntrantAccess.kitchenArea.rawValue, EntrantAccess.rideControl.rawValue, EntrantAccess.maintenance.rawValue]
             self.rideAccess = [RideAccess.accessAllRides.rawValue]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
            
        case .employeeRideServicePass:
            self.type = EntrantType.employeeRideServicePass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea.rawValue, EntrantAccess.rideControl.rawValue]
             self.rideAccess = [RideAccess.accessAllRides.rawValue]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
            
        case .employeeManagerPass:
            self.type = EntrantType.employeeManagerPass.rawValue
            self.areaAccess = EntrantAccess.allAreas
            self.rideAccess = [RideAccess.accessAllRides.rawValue]
            self.foodDiscount = 0.25
            self.merchDiscount = 0.25
        }
        
    }
    
    
    
}



