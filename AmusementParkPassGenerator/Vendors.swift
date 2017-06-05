//
//  Vendor.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 5/31/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

class Vendors {
    
    let firstName: String?
    let lastName: String?
    let birthday: String?
    let address: String?
    let city: String?
    let state: String?
    let zip: String?
    var areaAccess: [EntrantAccess]
    let vendorType: Vendor
    
    
    
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zip: String?, birthday: String?, vendorType: Vendor, dateOfVisit: String?) throws {
        
        
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.vendorType = vendorType
        self.areaAccess = []
        

        guard birthday != "" else { throw UserError.missingBirthday }
        
        guard birthday != nil else { throw UserError.missingBirthday }
        
        _ = try isTheirBirthday()
        
        guard dateOfVisit != "" else { throw UserError.missingDateOfVisit }
        
        guard let firstName = firstName, let lastName = lastName else { throw UserError.missingFullName }
        guard firstName != "", lastName != "" else { throw UserError.missingFullName }
        
        guard let address = address, let city = city, let state = state, let zip = zip else { throw UserError.missingFullAddress }
        guard address != "", city != "", state != "", zip != "" else { throw UserError.missingFullAddress }
    
        
        
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
    
    // method to see if it's the entrant's birthday
    func isTheirBirthday() throws -> Bool {
    print("checking birthday")
        
        guard let tempBirthday = birthday else { throw UserError.missingBirthday }
        if tempBirthday.characters.count != 10 { throw UserError.birthdayIncorrect }
        let myFormatter = DateFormatter()
        let calendar = Calendar.current
        let currentDate = Date()
        myFormatter.dateFormat = "MM/dd/yyyy"
        guard let formattedBirthday = myFormatter.date(from: tempBirthday) else { throw UserError.birthdayIncorrect }
        let todayComponents = calendar.dateComponents([.month, .day], from: currentDate)
        let birthdayComponents = calendar.dateComponents([.month, .day], from: formattedBirthday)
        if birthdayComponents.month == todayComponents.month && birthdayComponents.day! == todayComponents.day {
            print("Happy Birthday!")
            return true
        } else {
            return false
        }
        
    }

}
