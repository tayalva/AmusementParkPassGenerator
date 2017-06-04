//
//  Kiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/17/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation




// Swipe Methods for area access. Each method is a kiosk for that designated area. Passing in the pass type will return true if that pass type has access, and false if not. DispatchQueue is used to delay re-entry by 5 seconds. 

var reEntry = true




func AmusementAreaKisok(_ pass: PassCreator) -> Bool {
    
    
    let when = DispatchTime.now() + 5
    if reEntry == true {
        
        for access in pass.areaAccess {
            if access == EntrantAccess.amusementArea.rawValue {
                reEntry = false
                DispatchQueue.main.asyncAfter(deadline: when) {
                    reEntry = true
                    
                }
                print("Access Granted")
                return true
            }
        }
    }
    
    print("Access Denied")
    return false
}


func KitchenAreaKiosk(_ pass: PassCreator) -> Bool {
    
    
    let when = DispatchTime.now() + 5
    if reEntry == true {
        
    for access in pass.areaAccess {
        if access == EntrantAccess.kitchenArea.rawValue {
        reEntry = false
        DispatchQueue.main.asyncAfter(deadline: when) {
        reEntry = true
        
            }
            print("Access Granted")
            return true
        }
    }
}
    
    print("Access Denied")
        return false
}

func RideControlAreaKiosk(_ pass: PassCreator) -> Bool {
    
    let when = DispatchTime.now() + 5
    
    if reEntry == true {
    for access in pass.areaAccess {
        if access == EntrantAccess.rideControl.rawValue {
        reEntry = false
        DispatchQueue.main.asyncAfter(deadline: when) {
        reEntry = true
            }
            print("Access Granted")
            return true
        }
    }
}
    print("Access Denied")
    return false
}

func MaintenanceAreaKiosk(_ pass: PassCreator) -> Bool {
    
    let when = DispatchTime.now() + 5
    
    if reEntry == true {
    
    for access in pass.areaAccess {
        if access == EntrantAccess.maintenance.rawValue {
        reEntry = false
        DispatchQueue.main.asyncAfter(deadline: when) {
        reEntry = true
                
            }
            print("Access Granted")
            return true
        }
    }
    }
    print("Access Denied")
    return false
}

func OfficeAreaKiosk(_ pass: PassCreator) -> Bool {
    let when = DispatchTime.now() + 5
    
    if reEntry == true {
    
    for access in pass.areaAccess {
        if access == EntrantAccess.office.rawValue {
        reEntry = false
        DispatchQueue.main.asyncAfter(deadline: when) {
        reEntry = true
                
            }
            print("Access Granted")
            return true
        }
    }
    }
    print("Access Denied")
    return false
}

func AmusementAreaKiosk(_ pass: PassCreator) -> Bool {
    let when = DispatchTime.now() + 5
    
    if reEntry == true {
        
        for access in pass.areaAccess {
            if access == EntrantAccess.amusementArea.rawValue {
                reEntry = false
                DispatchQueue.main.asyncAfter(deadline: when) {
                    reEntry = true
                    
                }
                print("Access Granted")
                return true
            }
        }
    }
    print("Access Denied")
    return false
}

func rideAccessKiosk(_ pass: PassCreator) -> Bool {
    let when = DispatchTime.now() + 5
    
    if reEntry == true {
        
        for access in pass.rideAccess {
            if access == RideAccess.accessAllRides.rawValue {
                reEntry = false
                DispatchQueue.main.asyncAfter(deadline: when) {
                    reEntry = true
                    
                }
                print("Access Granted")
                return true
            }
        }
    }
    print("Access Denied")
    return false
}










