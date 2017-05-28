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


    
    init(type: GuestType, birthday: String?) throws {
        
        self.birthday = birthday
        self.type = type
 
        
  // method to see if it's the entrant's birthday
        
        
        func isTheirBirthday() throws -> Bool {
            guard let birthday = birthday else { return false
            
                throw UserError.missingBirthday
            }
            let myFormatter = DateFormatter()
            let calendar = Calendar.current
            let currentDate = Date()
            myFormatter.dateFormat = "MM/dd/yyyy"
            guard let formattedBirthday = myFormatter.date(from: birthday) else { return false }
            let todayComponents = calendar.dateComponents([.month, .day], from: currentDate)
            let birthdayComponents = calendar.dateComponents([.month, .day], from: formattedBirthday)
            if birthdayComponents.month == todayComponents.month && birthdayComponents.day! == todayComponents.day {
                
                print("Happy Birthday!")
                return true
                
            } else {
                
            
                return false
            }
            
        }
        

            try isTheirBirthday() //for some reason it need to call the function again? weird
        

// method to make ensure the entrant is 5 or under
        
        func isYoungerThan5() throws -> Bool  {
            guard let birthday = birthday else { return false }
            let myFormatter = DateFormatter()
            let calendar = Calendar.current
            let currentDate = Date()
            myFormatter.dateFormat = "MM/dd/yyy"
            guard let formattedBirthday = myFormatter.date(from: birthday) else {
                
                throw UserError.missingBirthday
                return false}
            let years = calendar.dateComponents([.year], from: formattedBirthday, to: currentDate)
            let age = years.year!
            if age <= 5 {
                
                print("You are under 5!")
                return true
            } else {
                
                return false
                
            }
        
        
        }
        
        switch type {
            
         case .classic:
           
          
            
     self.type = .classic
            
        case .child:
            
    
            guard let birthday = birthday else { throw UserError.missingBirthday }
            
            guard try isYoungerThan5() else { throw UserError.guestIsOlderThan5 }
            
            
            
        case .vip:
            
            self.type = .vip
           
        
            
        }
        
      
    }
    
    
}
