//
//  Guests.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/13/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

 class Guest: Visitor {

    let birthday: String?
    var type: GuestType
    let firstName: String?
    let lastName: String?
    let address: String?
    let city: String?
    let state: String?
    let zipCode: Int?

    
    init(type: GuestType, birthday: String?, firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: Int?) throws {
        
        self.birthday = birthday
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        
  
        
        if type == .child || type == .senior {
            
            guard birthday != "" else { throw UserError.missingBirthday }
            guard birthday != nil else { throw UserError.missingBirthday }
            
            _ = try isYoungerThan5()
            _ = try isTheirBirthday()
        }
        
        guard firstName != "", lastName != "" else { throw UserError.missingFullName }
        guard firstName != nil, lastName != nil else { throw UserError.missingFullName }
        guard address != "", city != "", state != "" else { throw UserError.missingFullAddress }
        guard address != nil, city != nil, state != nil else { throw UserError.missingFullAddress }
        
        
        guard zipCode != nil else {throw UserError.zipCodeIncorrect}
            
 
        
        
      
        
    }
    
    
      // method to see if it's the entrant's birthday
    func isTheirBirthday() throws -> Bool {
        guard let birthday = birthday else { throw UserError.missingBirthday }
        if birthday.characters.count != 10 { throw UserError.birthdayIncorrect }
        let myFormatter = DateFormatter()
        let calendar = Calendar.current
        let currentDate = Date()
        myFormatter.dateFormat = "MM/dd/yyyy"
        guard let formattedBirthday = myFormatter.date(from: birthday) else { throw UserError.birthdayIncorrect }
        let todayComponents = calendar.dateComponents([.month, .day], from: currentDate)
        let birthdayComponents = calendar.dateComponents([.month, .day], from: formattedBirthday)
        if birthdayComponents.month == todayComponents.month && birthdayComponents.day! == todayComponents.day {
            print("Happy Birthday!")
            return true
        } else {
            return false
        }
        
    }
    
    // method to make ensure the entrant is 5 or under
    func isYoungerThan5() throws -> Bool  {
        guard let tempBirthday = birthday else { throw UserError.missingBirthday }
        if tempBirthday.characters.count != 10 { throw UserError.birthdayIncorrect }
        let myFormatter = DateFormatter()
        let calendar = Calendar.current
        let currentDate = Date()
        myFormatter.dateFormat = "MM/dd/yyy"
        guard let formattedBirthday = myFormatter.date(from: tempBirthday) else { throw UserError.birthdayIncorrect }
        let years = calendar.dateComponents([.year], from: formattedBirthday, to: currentDate)
        let age = years.year!
        if age <= 5 {
            
            print("You are under 5!")
            return true
        } else {
            
            if type == .child {
                throw UserError.guestIsOlderThan5 }
            
            return false 
        }
        
    }
    
    
}
