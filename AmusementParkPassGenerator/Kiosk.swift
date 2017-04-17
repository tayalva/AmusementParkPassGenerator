//
//  Kiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/17/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation



    
func kitchenAreaAccess(_ pass: PassCreator) -> Bool {
        
        if pass.areaAccess != [EntrantAccess.kitchenArea] {
            
            return false
        }
        
        return true
}


