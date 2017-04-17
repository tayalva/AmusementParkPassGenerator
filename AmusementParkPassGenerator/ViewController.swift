//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*
        do {
        try Employee(firstName: nil, lastName: nil, address: "1232", city: "HB", state: "CA", zip: 92648)
        
        } catch UserError.missingFullName  {
            print("Please enter your full name")
        } catch {
            print(error)
        }
 */
        
        /*
        do {
            
            try Employee(firstName: "name", lastName: "name", address: "12", city: "HB", state: nil, zip: 9298)
        } catch UserError.missingFullAddress {
            
            print("Please provide your full address.")
        } catch {
            
            print(error)
        }
        */
        
        /*
        do {
            try Guest(type: .child, birthday: nil)
            
        } catch UserError.missingBirthday {
            
            print("Please enter your birthday")
        } catch UserError.guestIsOlderThan5 {
            
            print("You're older than 5!")
        
        } catch {
            
            print(error)
        }
        
 */
        do {
            
            try Guest(type: .vip, birthday: nil)
            print(rideControlAreaAcess(PassCreator(entrant: .employeeRideServicePass)))
            
            
            
        } catch { print(error) }

   // tests to make sure the created information is being displayed for each entrant type
        
        print(PassCreator(entrant: .employeeFoodServicePass).type!)
        print(PassCreator(entrant: .employeeFoodServicePass).rideAccess)
        print(PassCreator(entrant: .employeeFoodServicePass).areaAccess)
        print(PassCreator(entrant: .employeeFoodServicePass).foodDiscount)
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   


}

