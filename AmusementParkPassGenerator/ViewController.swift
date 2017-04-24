//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var reEntry = true

    
    @IBAction func test(_ sender: Any) {

// Below are the test cases. To test if a birthday is recognized, change the birth date to the current date.

////////////////////////////////////////////

 // Tests a classic guest entrant while printing access rights to the console
        do {
            
            try Guest(type: .classic, birthday: "04/25/1988")
         
         print(PassCreator(entrant: .classicGuestPass).type!)
         print(PassCreator(entrant: .classicGuestPass).rideAccess)
         print(PassCreator(entrant: .classicGuestPass).areaAccess)
         print(PassCreator(entrant: .classicGuestPass).foodDiscount)
         print(PassCreator(entrant: .classicGuestPass).merchDiscount)
         
        } catch {}
        

 
///////////////////////////////////////////
        
/* Tests a VIP guest entrant while printing access rights to the console
        
        do {
            
            try Guest(type: .vip, birthday: "04/21/1988")
         
         print(PassCreator(entrant: .vipGuestPass).type!)
         print(PassCreator(entrant: .classicGuestPass).rideAccess)
         print(PassCreator(entrant: .vipGuestPass).areaAccess)
         print(PassCreator(entrant: .vipGuestPass).foodDiscount)
         print(PassCreator(entrant: .vipGuestPass).merchDiscount)
         
        } catch {}
*/
///////////////////////////////////////////
        
/* Tests a child guest entrant while printing access rights to the console
         
         do {
         try Guest(type: .child, birthday: "04/04/2015")
         
         } catch UserError.missingBirthday {
         
         print("Please enter your birthday")
         } catch UserError.guestIsOlderThan5 {
         
         print("Guest is older than 5!")
         
         } catch {
         
         print(error)
         }
*/
        
 /////////////////////////////////////////
        
/* Tests a child guest entrant with a missing birthday, will throw an error that prints in the console
        
        do {
            try Guest(type: .child, birthday: nil)
            
        } catch UserError.missingBirthday {
            
            print("Please enter your birthday")
        } catch UserError.guestIsOlderThan5 {
            
            print("Guest is older than 5!")
            
        } catch {
            
            print(error)
        }
        
*/
        
 ///////////////////////////////////////////
        
 /* tests a Food Services employee entrant with all information while printing access rights to the console

        
        do {
            
           try Employee(firstName: "Taylor", lastName: "Smith", address: "123", city: "HB", state: "CA", zip: 92648, birthday: "04/25/1988", employeeType: .foodServices)
            
            print(PassCreator(entrant: .employeeFoodServicePass).type!)
            print(PassCreator(entrant: .employeeFoodServicePass).rideAccess)
            print(PassCreator(entrant: .employeeFoodServicePass).areaAccess)
            print(PassCreator(entrant: .employeeFoodServicePass).foodDiscount)
            print(PassCreator(entrant: .employeeFoodServicePass).merchDiscount)
            
        } catch UserError.missingFullAddress {
        print("Please enter your full address.")
        } catch UserError.missingFullName {
        print("Please enter your full name")
        }catch {}
*/
        
///////////////////////////////////////////
        
        
/* tests a food service employee with a missing address number:
 
        do {
            
            try Employee(firstName: "Taylor", lastName: "Smith", address: nil, city: "HB", state: "CA", zip: 92648, birthday: "04/25/1988", employeeType: .foodServices)
            
            print(PassCreator(entrant: .employeeFoodServicePass).type!)
            print(PassCreator(entrant: .employeeFoodServicePass).rideAccess)
            print(PassCreator(entrant: .employeeFoodServicePass).areaAccess)
            print(PassCreator(entrant: .employeeFoodServicePass).foodDiscount)
            print(PassCreator(entrant: .employeeFoodServicePass).merchDiscount)
            
        } catch UserError.missingFullAddress {
            print("Please enter your full address.")
        } catch UserError.missingFullName {
         print("Please enter your full name")
         } catch {}
 */
        
//////////////////////////////////////////
        
/* tests a food service employee with a missing last name
 
         do {
            try Employee(firstName: "Taylor", lastName: nil, address: "1232", city: "HB", state: "CA", zip: 92648, birthday: "04/04/1988", employeeType: .foodServices)
         
         } catch UserError.missingFullName  {
         print("Please enter your full name")
         } catch UserError.missingFullAddress {
         print("Please enter your full address.")
         } catch {}
*/
 
        
////////////////////////////////////////
        
/* tests a ride services employee while printing access rights to the console
 
        do {
            try Employee(firstName: "Taylor", lastName: "Smith", address: "1232", city: "HB", state: "CA", zip: 92648, birthday: "04/04/1988", employeeType: .rideServices)
            
            print(PassCreator(entrant: .employeeRideServicePass).type!)
            print(PassCreator(entrant: .employeeRideServicePass).rideAccess)
            print(PassCreator(entrant: .employeeRideServicePass).areaAccess)
            print(PassCreator(entrant: .employeeRideServicePass).foodDiscount)
            print(PassCreator(entrant: .employeeRideServicePass).merchDiscount)
 
        } catch UserError.missingFullName  {
        print("Please enter your full name")
        } catch UserError.missingFullAddress {
        print("Please enter your full address.")
        } catch {}
*/
        
//////////////////////////////////////
        
/* tests a ride services employee with a missing city
        
        do {
            try Employee(firstName: "Taylor", lastName: "Smith", address: "1232", city: nil, state: "CA", zip: 92648, birthday: "04/04/1988", employeeType: .rideServices)
            
            print(PassCreator(entrant: .employeeRideServicePass).type!)
            print(PassCreator(entrant: .employeeRideServicePass).rideAccess)
            print(PassCreator(entrant: .employeeRideServicePass).areaAccess)
            print(PassCreator(entrant: .employeeRideServicePass).foodDiscount)
            print(PassCreator(entrant: .employeeRideServicePass).merchDiscount)
            
        } catch UserError.missingFullName  {
            print("Please enter your full name")
        } catch UserError.missingFullAddress {
            print("Please enter your full address.")
        } catch {}
        
        
*/
        
////////////////////////////////////////
        
        
/* tests a ride services employee with a missing first name
         
         do {
         try Employee(firstName: nil, lastName: "Smith", address: "1232", city: "HB", state: "CA", zip: 92648, birthday: "04/04/1988", employeeType: .rideServices)
         
         print(PassCreator(entrant: .employeeRideServicePass).type!)
         print(PassCreator(entrant: .employeeRideServicePass).rideAccess)
         print(PassCreator(entrant: .employeeRideServicePass).areaAccess)
         print(PassCreator(entrant: .employeeRideServicePass).foodDiscount)
         print(PassCreator(entrant: .employeeRideServicePass).merchDiscount)
         
         } catch UserError.missingFullName  {
         print("Please enter your full name")
         } catch UserError.missingFullAddress {
         print("Please enter your full address.")
         } catch {}
 */
        
////////////////////////////////////////
        
        
/* tests a maintenance services employee
         
         do {
         try Employee(firstName: "Taylor", lastName: "Smith", address: "1232", city: "HB", state: "CA", zip: 92648, birthday: "04/04/1988", employeeType: .maintenance)
         
         print(PassCreator(entrant: .employeeMaintenancePass).type!)
         print(PassCreator(entrant: .employeeMaintenancePass).rideAccess)
         print(PassCreator(entrant: .employeeMaintenancePass).areaAccess)
         print(PassCreator(entrant: .employeeMaintenancePass).foodDiscount)
         print(PassCreator(entrant: .employeeMaintenancePass).merchDiscount)
         
         } catch UserError.missingFullName  {
         print("Please enter your full name")
         } catch UserError.missingFullAddress {
         print("Please enter your full address.")
         } catch {}
*/
 
 
////////////////////////////////////////
        
        
/* tests a maintenance services employee with a missing state
        
        do {
            try Employee(firstName: "Taylor", lastName: "Smith", address: "1232", city: "HB", state: nil, zip: 92648, birthday: "04/04/1988", employeeType: .maintenance)
            
            print(PassCreator(entrant: .employeeMaintenancePass).type!)
            print(PassCreator(entrant: .employeeMaintenancePass).rideAccess)
            print(PassCreator(entrant: .employeeMaintenancePass).areaAccess)
            print(PassCreator(entrant: .employeeMaintenancePass).foodDiscount)
            print(PassCreator(entrant: .employeeMaintenancePass).merchDiscount)
            
        } catch UserError.missingFullName  {
            print("Please enter your full name")
        } catch UserError.missingFullAddress {
            print("Please enter your full address.")
        } catch {}
*/
  
////////////////////////////////////////////
        
/* tests a manager employee
        
        do {
            try Employee(firstName: "Taylor", lastName: "Smith", address: "1232", city: "HB", state: "CA", zip: 92648, birthday: "04/04/1988", employeeType: .manager)
            
            print(PassCreator(entrant: .employeeManagerPass).type!)
            print(PassCreator(entrant: .employeeManagerPass).rideAccess)
            print(PassCreator(entrant: .employeeManagerPass).areaAccess)
            print(PassCreator(entrant: .employeeManagerPass).foodDiscount)
            print(PassCreator(entrant: .employeeManagerPass).merchDiscount)
            
        } catch UserError.missingFullName  {
            print("Please enter your full name")
        } catch UserError.missingFullAddress {
            print("Please enter your full address.")
        } catch {}
*/
        
///////////////////////////////////////////
        
/* tests a manager employee with a missing zip code
        
        do {
            try Employee(firstName: "Taylor", lastName: "Smith", address: "1232", city: "HB", state: "CA", zip: nil, birthday: "04/04/1988", employeeType: .manager)
            
            print(PassCreator(entrant: .employeeManagerPass).type!)
            print(PassCreator(entrant: .employeeManagerPass).rideAccess)
            print(PassCreator(entrant: .employeeManagerPass).areaAccess)
            print(PassCreator(entrant: .employeeManagerPass).foodDiscount)
            print(PassCreator(entrant: .employeeManagerPass).merchDiscount)
            
        } catch UserError.missingFullName  {
            print("Please enter your full name")
        } catch UserError.missingFullAddress {
            print("Please enter your full address.")
        } catch {}
 
 
 */
        
        
////////////////  KIOSKS  (click the test button repeatedly to show 5 second delay before re-entry after first swipe)

    // Amusement Area kiosk
        
            // for a classic guest:
        
                    // AmusementAreaKisok(PassCreator(entrant: .classicGuestPass))
        
            // for a VIP Guest:
        
                    // AmusementAreaKisok(PassCreator(entrant: .vipGuestPass))
        
            // For a Child Guest:
        
                   // AmusementAreaKisok(PassCreator(entrant: .childGuestPass))
        
            // For a Food Service Employee:
    
    
                  // AmusementAreaKisok(PassCreator(entrant: .employeeFoodServicePass))
        
            // For a Ride Services Employee:
        
                  // AmusementAreaKisok(PassCreator(entrant: .employeeRideServicePass))
        
            // For a Maintenance Employee: 
        
                  //  AmusementAreaKisok(PassCreator(entrant: .employeeMaintenancePass))
        
            // For a Manager Employee
        
                  // AmusementAreaKisok(PassCreator(entrant: .employeeManagerPass))
        
    // Ktichen Area Kiosk
        
            // for a classic guest:
        
                // KitchenAreaKiosk(PassCreator(entrant: .classicGuestPass))
        
            // for a VIP Guest:
        
                // KitchenAreaKiosk(PassCreator(entrant: .vipGuestPass))
        
            // For a Child Guest:
        
                // KitchenAreaKiosk(PassCreator(entrant: .childGuestPass))
        
            // For a Food Service Employee:
        
                // KitchenAreaKiosk(PassCreator(entrant: .employeeFoodServicePass))
        
            // For a Ride Services Employee:
        
                // KitchenAreaKiosk(PassCreator(entrant: .employeeRideServicePass))
        
            // For a Maintenance Employee:
        
                //  KitchenAreaKiosk(PassCreator(entrant: .employeeMaintenancePass))
        
            // For a Manager Employee
        
                // KitchenAreaKiosk(PassCreator(entrant: .employeeManagerPass))
        
    // Ride Control Areas
        
            // for a classic guest:
        
                // RideControlAreaKiosk(PassCreator(entrant: .classicGuestPass))
        
            // for a VIP Guest:
        
                // RideControlAreaKiosk(PassCreator(entrant: .vipGuestPass))
        
            // For a Child Guest:
        
                // RideControlAreaKiosk(PassCreator(entrant: .childGuestPass))
        
            // For a Food Service Employee:
        
                // RideControlAreaKiosk(PassCreator(entrant: .employeeFoodServicePass))
        
            // For a Ride Services Employee:
        
                // RideControlAreaKiosk(PassCreator(entrant: .employeeRideServicePass))
        
            // For a Maintenance Employee:
        
                //  RideControlAreaKiosk(PassCreator(entrant: .employeeMaintenancePass))
        
            // For a Manager Employee
        
                // RideControlAreaKiosk(PassCreator(entrant: .employeeManagerPass))
        
    // Maintenance Areas
        
            // for a classic guest:
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .classicGuestPass))
        
            // for a VIP Guest:
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .vipGuestPass))
        
            // For a Child Guest:
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .childGuestPass))
        
            // For a Food Service Employee:
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .employeeFoodServicePass))
        
            // For a Ride Services Employee:
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .employeeRideServicePass))
        
            // For a Maintenance Employee:
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .employeeMaintenancePass))
        
            // For a Manager Employee
        
                // MaintenanceAreaKiosk(PassCreator(entrant: .employeeManagerPass))
        
        
    // Maintenance Areas
        
            // for a classic guest:
        
                // OfficeAreaKiosk(PassCreator(entrant: .classicGuestPass))
        
            // for a VIP Guest:
        
                // OfficeAreaKiosk(PassCreator(entrant: .vipGuestPass))
        
            // For a Child Guest:
        
                // OfficeAreaKiosk(PassCreator(entrant: .childGuestPass))
        
            // For a Food Service Employee:
        
                // OfficeAreaKiosk(PassCreator(entrant: .employeeFoodServicePass))
        
            // For a Ride Services Employee:
        
                // OfficeAreaKiosk(PassCreator(entrant: .employeeRideServicePass))
        
            // For a Maintenance Employee:
        
                // OfficeAreaKiosk(PassCreator(entrant: .employeeMaintenancePass))
        
            // For a Manager Employee
        
                // OfficeAreaKiosk(PassCreator(entrant: .employeeManagerPass))
 

 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
  

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

