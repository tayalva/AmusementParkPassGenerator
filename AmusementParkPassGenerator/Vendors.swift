//
//  Vendor.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 5/31/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

class Vendors {
    
    let firstName: String
    let lastName: String
    let birthday: String?
    let address: String
    let city: String
    let state: String
    let zip: String
    let areaAccess: [EntrantAccess]
    let vendorType: Vendor
    
    
    
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zip: String?, birthday: String?, vendorType: Vendor) throws {
        
        guard let firstName = firstName, let lastName = lastName else { throw UserError.missingFullName }
        guard firstName != "", lastName != "" else { throw UserError.missingFullName }
        
        guard let address = address, let city = city, let state = state, let zip = zip else { throw UserError.missingFullAddress }
        guard address != "", city != "", state != "", zip != "" else { throw UserError.missingFullAddress }
        
        guard let birthday = birthday else { throw UserError.missingBirthday }
        guard birthday != "" else { throw UserError.missingBirthday }
        
        
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.vendorType = vendorType
        
        
        
        switch vendorType {
            
        case .acme:
            
            self.areaAccess = [.kitchenArea]
            
        case .fedex:
            
            self.areaAccess = [.amusementArea, .rideControl, .kitchenArea]
            
        case .nwElectrical:
            
            self.areaAccess = [.maintenance, .office]
            
        case.orkin:
            
            self.areaAccess = [.amusementArea, .kitchenArea, .maintenance, .office, .rideControl]
        }
}

}
