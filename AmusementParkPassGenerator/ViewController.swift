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

    @IBOutlet weak var employeeView: UIView!
    @IBOutlet weak var guestView: UIView!
    @IBOutlet weak var entrantView: UIView!
    @IBOutlet weak var guestButtonOutlet: UIButton!
    @IBOutlet weak var employeeButtonOutlet: UIButton!
    @IBOutlet weak var managerButtonOutlet: UIButton!
    @IBOutlet weak var vendorButtonOutlet: UIButton!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var dobTextBox: UITextField!
    @IBOutlet weak var dateOfVisitTextBox: UITextField!
    @IBOutlet weak var projectNumberTextBox: UITextField!
    @IBOutlet weak var firstNameTextBox: UITextField!
    @IBOutlet weak var lastNameTextBox: UITextField!
    @IBOutlet weak var companyTextBox: UITextField!
    @IBOutlet weak var addressTextBox: UITextField!
    @IBOutlet weak var cityTextBox: UITextField!
    @IBOutlet weak var stateTextBox: UITextField!
    @IBOutlet weak var zipcodeTextBox: UITextField!
    
    
    var selectedEntrant: EntrantType = EntrantType.classicGuestPass
    
    @IBAction func generatePassButton(_ sender: Any) {
        
        print(selectedEntrant)
        
        
        switch selectedEntrant {
            
        case .classicGuestPass:
            
            do {
                
               _ = try Guest(type: .classic, birthday: nil, firstName: nil, lastName: nil, address: nil, city: nil, state: nil, zipCode: nil)
                
            } catch {}
            
        case .vipGuestPass:
            
            do {
                
               _ = try Guest(type: .vip, birthday: nil, firstName: nil, lastName: nil, address: nil, city: nil, state: nil, zipCode: nil)
                
        
                
            } catch {}
            
        case .childGuestPass:
            
            do {
                
              _ =  try Guest(type: .child, birthday: dobTextBox.text, firstName: nil, lastName: nil, address: nil, city: nil, state: nil, zipCode: nil)
                
            } catch UserError.missingBirthday {
                displayAlert("Missing Info", andMessage: "Please provide guest's date of birth")
                
            } catch UserError.guestIsOlderThan5 {
                
                displayAlert("Not Eligible", andMessage: "Guest must be 5 years old or younger. Please select a different pass")
                
            } catch {}
         
         
            
        case .seniorGuestPass:
            
            
            do {
                
               _ = try Guest(type: .senior, birthday: dobTextBox.text, firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: nil, city: nil, state: nil, zipCode: nil)
            } catch UserError.missingFullName{
                displayAlert("Missing Name", andMessage: "Please provide both a first and last name")
            }catch UserError.missingBirthday{
                displayAlert("Missing Birthday", andMessage: "Please provide your date of birth")
            } catch {}
            
            
        case .seasonGuestPass:
            
            do {
                
                _ = try Guest(type: .season, birthday: nil, firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zipCode: zipcodeTextBox.text)
            } catch UserError.missingFullName{
                displayAlert("Missing Name", andMessage: "Please provide both a first and last name")
            }catch UserError.missingBirthday{
                displayAlert("Missing Birthday", andMessage: "Please provide your date of birth")
            } catch {}
            
        case .employeeFoodServicePass:
            
            
            do {
                
                _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .foodServices)
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
        
        
        case .employeeMaintenancePass:
            
            do {
            
            _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .maintenance)
            
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
            
        case .employeeRideServicePass:
            
            do {
                
                _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .rideServices)
                
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
            
        case .employeeManagerPass: break
            
        case .employeeContractPass: break
            
        case .vendorPass: break
            
            
        }
        
    }
    
    @IBAction func EntrantButtons(_ sender: UIButton) {
        
        switch sender.tag {
            
        case 1: //Guest
            
            
            disableTextFields()
            UIView.animate(withDuration: 0.5, animations: {
            self.guestView.frame.origin.y = self.entrantView.frame.origin.y + self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.employeeView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            
            
        case 2: //Employee
            disableTextFields()
            UIView.animate(withDuration: 0.5, animations: {
            self.employeeView.frame.origin.y = self.entrantView.frame.origin.y + self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.guestView.frame.origin.y = self.mainView.frame.origin.y - self.mainView.frame.size.height})
            
        case 3: //Manager
            selectedEntrant = EntrantType.employeeManagerPass
            disableTextFields()
            enableNameAddressFields()
            UIView.animate(withDuration: 0.5, animations: {
            self.guestView.frame.origin.y = self.mainView.frame.origin.y - self.mainView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.employeeView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            
        case 4: //Vendor
            selectedEntrant = EntrantType.vendorPass
            disableTextFields()
            
            self.firstNameTextBox.isEnabled = true
            self.lastNameTextBox.isEnabled = true
            self.companyTextBox.isEnabled = true
            self.dateOfVisitTextBox.isEnabled = true
            self.dobTextBox.isEnabled = true
            
            self.firstNameTextBox.alpha = 1.0
            self.lastNameTextBox.alpha = 1.0
            self.companyTextBox.alpha = 1.0
            self.dateOfVisitTextBox.alpha = 1.0
            self.dobTextBox.alpha = 1.0
            
            
            UIView.animate(withDuration: 0.5, animations: {
            self.guestView.frame.origin.y = self.mainView.frame.origin.y - self.mainView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.employeeView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            
        default:
            
            break
            
        }
    }
    
    
    @IBAction func guestTypeButtons(_ sender: UIButton) {
        
        switch sender.tag {
            
        case 1: //child
            
            disableTextFields()
            dobTextBox.isEnabled = true
            dobTextBox.alpha = 1.0
            
            selectedEntrant = EntrantType.childGuestPass
            
        case 2: //adult
            
            disableTextFields()
            selectedEntrant = EntrantType.classicGuestPass
            
        case 3: //senior
            
            disableTextFields()
            
            dobTextBox.isEnabled = true
            dobTextBox.alpha = 1.0
            firstNameTextBox.isEnabled = true
            firstNameTextBox.alpha = 1.0
            lastNameTextBox.isEnabled = true
            lastNameTextBox.alpha = 1.0
            
            selectedEntrant = EntrantType.seniorGuestPass
            
        case 4: // VIP
            
            disableTextFields()
            
            selectedEntrant = EntrantType.vipGuestPass
            
        case 5: // season pass
            
            disableTextFields()
            
            enableNameAddressFields()
            
            selectedEntrant = EntrantType.seasonGuestPass
            
        default: break
        }
        
    }
    
    @IBAction func employeeTypeButtons(_ sender: UIButton) {
        
       switch sender.tag {
            
        case 1: //Food Services
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeFoodServicePass
        
       case 2: //Ride Services
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeRideServicePass

        
       case 3: //Maintenance Services
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeMaintenancePass

        
       case 4: //Contract
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeContractPass
        
            default: break
        }
        
    }
    
    

    
    @IBAction func test(_ sender: Any) {

// Below are the test cases. To test if a birthday is recognized, change the birth date to the current date.

////////////////////////////////////////////


        

 
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
        
        view.bringSubview(toFront: entrantView)
        
        disableTextFields()
        
  

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func disableTextFields() {
        
        dobTextBox.isEnabled = false
        dobTextBox.alpha = 0.3
        
        dateOfVisitTextBox.isEnabled = false
        dateOfVisitTextBox.alpha = 0.3
        
        projectNumberTextBox.isEnabled = false
        projectNumberTextBox.alpha = 0.3
        
        firstNameTextBox.isEnabled = false
        firstNameTextBox.alpha = 0.3
        
        lastNameTextBox.isEnabled = false
        lastNameTextBox.alpha = 0.3
        
        companyTextBox.isEnabled = false
        companyTextBox.alpha = 0.3
        
        addressTextBox.isEnabled = false
        addressTextBox.alpha = 0.3
        
        cityTextBox.isEnabled = false
        cityTextBox.alpha = 0.3
        
        stateTextBox.isEnabled = false
        stateTextBox.alpha = 0.3
        
        zipcodeTextBox.isEnabled = false
        zipcodeTextBox.alpha = 0.3
    }
    
    func enableNameAddressFields() {
        
        firstNameTextBox.isEnabled = true
        firstNameTextBox.alpha = 1.0
        
        lastNameTextBox.isEnabled = true
        lastNameTextBox.alpha = 1.0
        
        addressTextBox.isEnabled = true
        addressTextBox.alpha = 1.0
        
        cityTextBox.isEnabled = true
        cityTextBox.alpha = 1.0
        
        stateTextBox.isEnabled = true
        cityTextBox.alpha = 1.0
        
        zipcodeTextBox.isEnabled = true
        zipcodeTextBox.alpha = 1.0
        
    }
    
    func displayAlert(_ title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }

}

