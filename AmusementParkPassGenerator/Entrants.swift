//
//  Entrants.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


protocol Entrants {
    
    var firstName: String { get }
    var lastName: String { get }
    var address: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
    var DOB: String { get }
    
}

protocol Worker {
    
    
}

class Guest: Entrants {

    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: Int
    var DOB: String

    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: Int, DOB: String){
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.DOB = DOB
    }
    
}

class Employee: Entrants {
    
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: Int
    var DOB: String
    
    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: Int, DOB: String){
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.DOB = DOB
    }
}


class ClassicGuest: Guest {
    
    
}

class VipGuest: Guest {
    
    
}

class ChildGuest: Guest {
    
    
}
