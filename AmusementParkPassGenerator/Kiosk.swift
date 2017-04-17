//
//  Kiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/17/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation



    
func kitchenAreaAccess(_ pass: PassCreator) -> Bool {
    for access in pass.areaAccess {
        
        if access == EntrantAccess.kitchenArea {
            
            print("Access Granted")
            
            return true
        }
        }
    
    print("Access Denied")
        return false
}

func rideControlAreaAcess(_ pass: PassCreator) -> Bool {
    
    for access in pass.areaAccess {
        
        if access == EntrantAccess.rideControl {
            
            return true
        }
    }
    
    return false
}


