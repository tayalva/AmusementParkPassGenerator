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
            myFormatter.dateFormat = "MM/dd"
            let formattedBirthday = myFormatter.date(from: birthday!)
            let days = calendar.dateComponents([.day], from: formattedBirthday!, to: currentDate)
            let age = days.day!
            
            if age % 365 == 0 {
                
                print("Happy Birthday!")
                return true
                
            } else {
                
                print("tis not your birthday")
                return false }

            
        }

        
        func isYoungerThan5() -> Bool  {
            let myFormatter = DateFormatter()
            let calendar = Calendar.current
            let currentDate = Date()
            myFormatter.dateFormat = "MM/dd/yyy"
            let formattedBirthday = myFormatter.date(from: birthday!)
            let days = calendar.dateComponents([.day], from: formattedBirthday!, to: currentDate)
            let age = Double(days.day!) / 365
            if age <= 5.0 {
                return true
            } else {
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
