//
//  Kiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/17/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


// Swipe Methods for area access. Each method is a kiosk for that designated area. Passing in the pass type will return true if that pass type has access, and false if not
    
func KitchenAreaKiosk(_ pass: PassCreator) -> Bool {
    for access in pass.areaAccess {
        
        if access == EntrantAccess.kitchenArea {
            return true
        }
    }
        return false
}

func RideControlAreaKiosk(_ pass: PassCreator) -> Bool {
    
    for access in pass.areaAccess {
        if access == EntrantAccess.rideControl {
            return true
        }
    }
    
    return false
}

func MaintenanceAreaKiosk(_ pass: PassCreator) -> Bool {
    
    for access in pass.areaAccess {
        if access == EntrantAccess.maintenance {
            return true
        }
    }
    
    return false
}

func OfficeAreaKiosk(_ pass: PassCreator) -> Bool {
    
    for access in pass.areaAccess {
        if access == EntrantAccess.office {
            return true
        }
    }
    
    return false
}














