//
//  PassCreator.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/17/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


class PassCreator: Discount {
    
    var entrantName: String?
    var type: String?
    var areaAccess: [EntrantAccess]
    var rideAccess: [RideAccess]
    var foodDiscount: Double
    var merchDiscount: Double
    
    init(entrant: EntrantType) {
        
        switch entrant {
        case .classicGuestPass:
            self.type = EntrantType.classicGuestPass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea]
            self.rideAccess = [RideAccess.accessAllRides]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            
        case .childGuestPass:
            self.type = EntrantType.childGuestPass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea]
            self.rideAccess = [RideAccess.accessAllRides]
            self.foodDiscount = 0.0
            self.merchDiscount = 0.0
            
        case .vipGuestPass:
            self.type = EntrantType.vipGuestPass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea]
            self.rideAccess = [RideAccess.accessAllRides, RideAccess.frontOfLinePass]
            self.foodDiscount = 0.10
            self.merchDiscount = 0.20
            
        case .employeeFoodServicePass:
            self.type = EntrantType.employeeFoodServicePass.rawValue
             self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.kitchenArea]
             self.rideAccess = [RideAccess.accessAllRides]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
            
        case .employeeMaintenancePass:
            self.type = EntrantType.employeeMaintenancePass.rawValue
        self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.kitchenArea, EntrantAccess.rideControl, EntrantAccess.maintenance]
             self.rideAccess = [RideAccess.accessAllRides]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
            
        case .employeeRideServicePass:
            self.type = EntrantType.employeeRideServicePass.rawValue
            self.areaAccess = [EntrantAccess.amusementArea, EntrantAccess.rideControl]
             self.rideAccess = [RideAccess.accessAllRides]
            self.foodDiscount = 0.15
            self.merchDiscount = 0.25
            
        case .employeeManagerPass:
            self.type = EntrantType.employeeManagerPass.rawValue
            self.areaAccess = EntrantAccess.allAreas
             self.rideAccess = [RideAccess.accessAllRides]
            self.foodDiscount = 0.25
            self.merchDiscount = 0.25
        }
        
    }
    
    func createPass(_ entrant: EntrantType) -> PassCreator {
        
        return PassCreator(entrant: entrant)
        
    }
    
}


