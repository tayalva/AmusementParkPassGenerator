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
    let areaAccess: [EntrantAccess]


    
    init(type: GuestType, birthday: String?) throws {
        
        self.birthday = birthday
        self.type = type
        
        func isTheirBirthday() -> Bool {
            
            let myFormatter = DateFormatter()
            let calendar = Calendar.current
            let currentDate = Date()
            myFormatter.dateFormat = "MM/dd/yyyy"
            let formattedBirthday = myFormatter.date(from: birthday!)
            let todayComponents = calendar.dateComponents([.month, .day], from: currentDate)
            let birthdayComponents = calendar.dateComponents([.month, .day], from: formattedBirthday!)
            if birthdayComponents.month == todayComponents.month && birthdayComponents.day! == todayComponents.day {
                
                print("Happy Birthday!")
                return true
                
            } else {
                
                print("tis not your birthday")
                return false
            }
            
        }
        
        isTheirBirthday()
        

        
        func isYoungerThan5() -> Bool  {
            let myFormatter = DateFormatter()
            let calendar = Calendar.current
            let currentDate = Date()
            myFormatter.dateFormat = "MM/dd/yyy"
            let formattedBirthday = myFormatter.date(from: birthday!)
            let years = calendar.dateComponents([.year], from: formattedBirthday!, to: currentDate)
            let age = years.year!
            if age <= 5 {
                
                print("You are under 5!")
                return true
            } else {
                print("You're too old!")
                return false
                
            }
        }
        
        switch type {
            
        case .classic:
           
            self.areaAccess = [EntrantAccess.amusementArea]
          
            
            if isYoungerThan5() == true {
                self.type = .child
                
            } else { self.type = .classic }
            
        case .child:
            
            self.areaAccess = [EntrantAccess.amusementArea]
    
            guard let birthday = birthday else { throw UserError.missingBirthday }
            
            if isYoungerThan5() {
                self.type = .child
                
            } else {
                
                self.type = .classic
                throw UserError.guestIsOlderThan5 }
            
            
            
        case .vip:
            self.areaAccess = [EntrantAccess.amusementArea]
        
            
        }
        
      
    }
    
    
}
