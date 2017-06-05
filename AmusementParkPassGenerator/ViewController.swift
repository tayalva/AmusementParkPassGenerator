//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 4/10/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

 var selectedEntrant: EntrantType = EntrantType.classicGuestPass

var nameForPass = ""

class ViewController: UIViewController, UITextFieldDelegate {
    
    var reEntry = true
   
    @IBOutlet weak var vendorView: UIView!
    @IBOutlet weak var employeeView: UIView!
    @IBOutlet weak var guestView: UIView!
    @IBOutlet weak var entrantView: UIView!
    @IBOutlet weak var guestButtonOutlet: UIButton!
    @IBOutlet weak var employeeButtonOutlet: UIButton!
    @IBOutlet weak var managerButtonOutlet: UIButton!
    @IBOutlet weak var vendorButtonOutlet: UIButton!
    @IBOutlet weak var generatePassButtonOutlet: UIButton!
    @IBOutlet weak var popDataButtonOutlet: UIButton!
    
    @IBOutlet weak var blankView: UIView!
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
                
            } catch UserError.birthdayIncorrect {
            
                   displayAlert("Invalid Birthday Format", andMessage: "Please provide a birth date in MM/DD/YYYY format")
            
            } catch {}
            
    
         
            
        case .seniorGuestPass:
            
            do {
                
               _ = try Guest(type: .senior, birthday: dobTextBox.text, firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: nil, city: nil, state: nil, zipCode: nil)
            }catch UserError.missingBirthday {
    
                    displayAlert("Missing Info", andMessage: "Please provide guest's date of birth")
            } catch UserError.missingFullName{
                displayAlert("Missing Name", andMessage: "Please provide both a first and last name")
            }catch UserError.birthdayIncorrect {
                
                displayAlert("Invalid Birthday Format", andMessage: "Please provide a birth date in MM/DD/YYYY format")
            
            
            }catch {}
            
            
        case .seasonGuestPass:
            
            
            
            do {
               _ = try Guest(type: .season, birthday: nil, firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zipCode: Int(zipcodeTextBox.text!))
                
            }catch UserError.missingFullName {
                
                  displayAlert("Missing Name", andMessage: "Please provide both a first and last name")
            }catch UserError.missingFullAddress{
                
                 displayAlert("Missing Address", andMessage: "Please provide your full address")
            }catch UserError.zipCodeIncorrect {
            
            displayAlert("Invalid Zip Code", andMessage: "Please provide a zip code in numerical format")
            } catch {}
            
            if (stateTextBox.text?.characters.count)! < 2 || (stateTextBox.text?.characters.count)! > 2 {
                
                displayAlert("Invalid State", andMessage: "Please provide a 2 character state abbreviation")
            }
            
        
            if (zipcodeTextBox.text?.characters.count)! != 5  {
                
                displayAlert("Invalid Zip Code", andMessage: "Zip Codes are 5 numerical digits long")
            }
            

            
            
    
        case .employeeFoodServicePass:
            
            
            do {
                
                _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .foodServices, projectNumber: nil)
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
            
            if (stateTextBox.text?.characters.count)! < 2 || (stateTextBox.text?.characters.count)! > 2 {
                
                displayAlert("Invalid State", andMessage: "Please provide a 2 character state abbreviation")
            }
            
            if (zipcodeTextBox.text?.characters.count)! > 5 || (zipcodeTextBox.text?.characters.count)! < 5 {
                
                displayAlert("Invalid Zip Code", andMessage: "Zip Codes are 5 digits long")
            }
        
        
        case .employeeMaintenancePass:
            
            do {
            
            _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .maintenance, projectNumber: nil)
            
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
            
            if (stateTextBox.text?.characters.count)! < 2 || (stateTextBox.text?.characters.count)! > 2 {
                
                displayAlert("Invalid State", andMessage: "Please provide a 2 character state abbreviation")
            }
            
            if (zipcodeTextBox.text?.characters.count)! > 5 || (zipcodeTextBox.text?.characters.count)! < 5 {
                
                displayAlert("Invalid Zip Code", andMessage: "Zip Codes are 5 digits long")
            }
            
        case .employeeRideServicePass:
            
            do {
                
                _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .rideServices, projectNumber: nil)
                
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
            
            if (stateTextBox.text?.characters.count)! < 2 || (stateTextBox.text?.characters.count)! > 2 {
                
                displayAlert("Invalid State", andMessage: "Please provide a 2 character state abbreviation")
            }
            
            if (zipcodeTextBox.text?.characters.count)! > 5 || (zipcodeTextBox.text?.characters.count)! < 5 {
                
                displayAlert("Invalid Zip Code", andMessage: "Zip Codes are 5 digits long")
            }
            
        case .employeeManagerPass:
            
            do {
                
                _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .manager, projectNumber: nil)
                
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch {}
            
            if (stateTextBox.text?.characters.count)! < 2 || (stateTextBox.text?.characters.count)! > 2 {
                
                displayAlert("Invalid State", andMessage: "Please provide a 2 character state abbreviation")
            }
            
            if (zipcodeTextBox.text?.characters.count)! > 5 || (zipcodeTextBox.text?.characters.count)! < 5 {
                
                displayAlert("Invalid Zip Code", andMessage: "Zip Codes are 5 digits long")
            }
            
        case .employeeContractPass:
            
            do {
                
                _ = try Employee(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: addressTextBox.text, city: cityTextBox.text, state: stateTextBox.text, zip: zipcodeTextBox.text, birthday: nil, employeeType: .contract, projectNumber: projectNumberTextBox.text)
                
            } catch UserError.missingFullAddress {
                displayAlert("Missing Address", andMessage: "Please provide your full address")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            }catch UserError.missingProjectNumber {
            
                displayAlert("Missing Project Number", andMessage: "Please provide a valid project number")
            } catch UserError.wrongProjectNumber {
            
                displayAlert("That project doesn't exist!", andMessage: "Please provide a valid project number")
            } catch {}
            
            if (stateTextBox.text?.characters.count)! < 2 || (stateTextBox.text?.characters.count)! > 2 {
                
                displayAlert("Invalid State", andMessage: "Please provide a 2 character state abbreviation")
            }
            
            if (zipcodeTextBox.text?.characters.count)! > 5 || (zipcodeTextBox.text?.characters.count)! < 5 {
                
                displayAlert("Invalid Zip Code", andMessage: "Zip Codes are 5 digits long")
            }
            
        case .vendorAcmePass:
            
         
            
            do {
                
                _ = try Vendors(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: nil, city: nil, state: nil, zip: nil, birthday: dobTextBox.text, vendorType: .acme, dateOfVisit: dateOfVisitTextBox.text)
            } catch UserError.missingBirthday {
                
                     displayAlert("Missing Info", andMessage: "Please provide guest's date of birth")
            
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            } catch UserError.missingDateOfVisit {
                
                displayAlert("Missing Date Of Visit", andMessage: "Please provide the visit date")
            }catch UserError.birthdayIncorrect {
                
                displayAlert("Invalid Birthday Format", andMessage: "Please provide a birth date in MM/DD/YYYY format")
                
                
        }catch {}
            
        case .vendorOrkinPass:
            
            do {
                
                _ = try Vendors(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: nil, city: nil, state: nil, zip: nil, birthday: dobTextBox.text, vendorType: .orkin, dateOfVisit: dateOfVisitTextBox.text)
            } catch UserError.missingBirthday {
                    displayAlert("Missing Info", andMessage: "Please provide guest's date of birth")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            } catch UserError.missingDateOfVisit {
                
                displayAlert("Missing Date Of Visit", andMessage: "Please provide the visit date")
            }catch UserError.birthdayIncorrect {
                
                displayAlert("Invalid Birthday Format", andMessage: "Please provide a birth date in MM/DD/YYYY format")
                
                
            }catch {}
            
        case .vendorFedexPass:
            
            do {
                
                _ = try Vendors(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: nil, city: nil, state: nil, zip: nil, birthday: dobTextBox.text, vendorType: .fedex, dateOfVisit: dateOfVisitTextBox.text)
            } catch UserError.missingBirthday {
                    
                    displayAlert("Missing Info", andMessage: "Please provide guest's date of birth")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            } catch UserError.missingDateOfVisit {
                
                displayAlert("Missing Date Of Visit", andMessage: "Please provide the visit date")
            }catch UserError.birthdayIncorrect {
                
                displayAlert("Invalid Birthday Format", andMessage: "Please provide a birth date in MM/DD/YYYY format")
                
                
            }catch {}
            
        case .vendorNwElectrical:
            
            do {
                
                _ = try Vendors(firstName: firstNameTextBox.text, lastName: lastNameTextBox.text, address: nil, city: nil, state: nil, zip: nil, birthday: dobTextBox.text, vendorType: .nwElectrical, dateOfVisit: dateOfVisitTextBox.text)
            } catch UserError.missingBirthday {
                    displayAlert("Missing Info", andMessage: "Please provide guest's date of birth")
            } catch UserError.missingFullName {
                displayAlert("Missing Full Name", andMessage: "Please provide both a first and last name")
            } catch UserError.missingDateOfVisit {
                
                displayAlert("Missing Date Of Visit", andMessage: "Please provide the visit date")
            }catch UserError.birthdayIncorrect {
                
                displayAlert("Invalid Birthday Format", andMessage: "Please provide a birth date in MM/DD/YYYY format")
                
                
            }catch {}
            
        }
        
         let firstNameText = firstNameTextBox.text!
         let lastNameText = lastNameTextBox.text!
        
        nameForPass = "\(firstNameText) \(lastNameText)"
        
        _ = PassCreator(entrant: selectedEntrant, name: nameForPass)
        

    }
    
    @IBAction func EntrantButtons(_ sender: UIButton) {
        
        generatePassButtonOutlet.isEnabled = false
        generatePassButtonOutlet.alpha = 0.3
        popDataButtonOutlet.isEnabled = false
        popDataButtonOutlet.alpha = 0.3
        
        switch sender.tag {
            
        case 1: //Guest
            
            
            disableTextFields()
        
            UIView.animate(withDuration: 0.5, animations: {
                self.guestView.frame.origin.y = self.entrantView.frame.origin.y + self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
                self.employeeView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
                self.vendorView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            

            
        case 2: //Employee
            disableTextFields()
       
            
            UIView.animate(withDuration: 0.5, animations: {
                self.guestView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
                self.employeeView.frame.origin.y = self.entrantView.frame.origin.y + self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
                self.vendorView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            
        case 3: //Manager
            
            generatePassButtonOutlet.isEnabled = true
            generatePassButtonOutlet.alpha = 1.0
            popDataButtonOutlet.isEnabled = true
            popDataButtonOutlet.alpha = 1.0
            
            selectedEntrant = EntrantType.employeeManagerPass
            disableTextFields()
            enableNameAddressFields()
            UIView.animate(withDuration: 0.5, animations: {
            self.guestView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.employeeView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
                self.vendorView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            
        case 4: //Vendor
      
            disableTextFields()
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.vendorView.frame.origin.y = self.entrantView.frame.origin.y + self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.guestView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            UIView.animate(withDuration: 0.5, animations: {
            self.employeeView.frame.origin.y = self.entrantView.frame.origin.y - self.entrantView.frame.size.height})
            
        default:
            
            break
            
        }
    }
    
    
    @IBAction func guestTypeButtons(_ sender: UIButton) {
        
        generatePassButtonOutlet.isEnabled = true
        generatePassButtonOutlet.alpha = 1.0
        popDataButtonOutlet.isEnabled = true
        popDataButtonOutlet.alpha = 1.0
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
        
        generatePassButtonOutlet.isEnabled = true
        generatePassButtonOutlet.alpha = 1.0
        popDataButtonOutlet.isEnabled = true
        popDataButtonOutlet.alpha = 1.0
        
       switch sender.tag {
            
        case 1: //Food Services
            
            disableTextFields()
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeFoodServicePass
        
       case 2: //Ride Services
        
         disableTextFields()
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeRideServicePass

        
       case 3: //Maintenance Services
        
         disableTextFields()
        
        enableNameAddressFields()
        
        selectedEntrant = EntrantType.employeeMaintenancePass

        
       case 4: //Contract
        
         disableTextFields()
        
        enableNameAddressFields()
         
         projectNumberTextBox.isEnabled = true
         projectNumberTextBox.alpha = 1.0
         popDataButtonOutlet.isEnabled = true
         popDataButtonOutlet.alpha = 1.0
        
        selectedEntrant = EntrantType.employeeContractPass
        
            default: break
        }
        
    }
    
    @IBAction func vendorTypeButtons(_ sender: UIButton) {
        
        generatePassButtonOutlet.isEnabled = true
        generatePassButtonOutlet.alpha = 1.0
        popDataButtonOutlet.isEnabled = true
        popDataButtonOutlet.alpha = 1.0
        
        switch sender.tag {
            
        case 1: //Acme
            
             selectedEntrant = EntrantType.vendorAcmePass
            
             disableTextFields()
             vendorTextFields()
            companyTextBox.text = "Acme"
            
        case 2: //Orkin
            
            selectedEntrant = EntrantType.vendorOrkinPass
            
            disableTextFields()
            vendorTextFields()
            companyTextBox.text = "Orkin"
            
        case 3: //FedEx
            
            selectedEntrant = EntrantType.vendorFedexPass
            
            disableTextFields()
            vendorTextFields()
            companyTextBox.text = "FedEx"
            
        case 4: //NW Electrial
            
            selectedEntrant = EntrantType.vendorNwElectrical
            
            disableTextFields()
            vendorTextFields()
            
            companyTextBox.text = "NW Electrical"
            
        default: break

        }
        
    }
    
    @IBAction func popDataButton(_ sender: Any) {
        
        switch selectedEntrant {
            
        case .childGuestPass:
            
            dobTextBox.text = "04/04/2015"
        
        case .classicGuestPass:
            
            break
            
        case .seniorGuestPass:
            
            dobTextBox.text = "04/04/1955"
            firstNameTextBox.text = "Taylor"
            lastNameTextBox.text = "Smith"
            
        case .vipGuestPass:
            
            break
        
        case .seasonGuestPass:
            
        
            firstNameTextBox.text = "Taylor"
            lastNameTextBox.text = "Smith"
            addressTextBox.text = "123 Swift lane"
            cityTextBox.text = "Huntington Beach"
            stateTextBox.text = "CA"
            zipcodeTextBox.text = "12345"
            
        case .employeeFoodServicePass, .employeeRideServicePass, .employeeMaintenancePass, .employeeManagerPass:
            
            firstNameTextBox.text = "Taylor"
            lastNameTextBox.text = "Smith"
            addressTextBox.text = "123 Swift lane"
            cityTextBox.text = "Huntington Beach"
            stateTextBox.text = "CA"
            zipcodeTextBox.text = "12345"
            
        case .employeeContractPass:
            
            projectNumberTextBox.text = "1001"
            firstNameTextBox.text = "Taylor"
            lastNameTextBox.text = "Smith"
            addressTextBox.text = "123 Swift lane"
            cityTextBox.text = "Huntington Beach"
            stateTextBox.text = "CA"
            zipcodeTextBox.text = "12345"
            
        case .vendorAcmePass, .vendorOrkinPass, .vendorFedexPass, .vendorNwElectrical:
            
            dobTextBox.text = "04/04/1988"
            dateOfVisitTextBox.text = "05/30/2017"
            firstNameTextBox.text = "Taylor"
            lastNameTextBox.text = "Smith"
        
        }
        
        
  
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubview(toFront: entrantView)
        
        disableTextFields()
        generatePassButtonOutlet.isEnabled = false
        popDataButtonOutlet.isEnabled = false
        generatePassButtonOutlet.alpha = 0.3
        popDataButtonOutlet.alpha = 0.3
        
        
        dobTextBox.delegate = self
        dateOfVisitTextBox.delegate = self
        projectNumberTextBox.delegate = self
        firstNameTextBox.delegate = self
        lastNameTextBox.delegate = self
        companyTextBox.delegate = self
        addressTextBox.delegate = self
        cityTextBox.delegate = self
        stateTextBox.delegate = self
        zipcodeTextBox.delegate = self
  

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func vendorTextFields() {
        
        firstNameTextBox.isEnabled = true
        firstNameTextBox.alpha = 1
        
        lastNameTextBox.isEnabled = true
        lastNameTextBox.alpha = 1
        
        companyTextBox.isEnabled = true
        companyTextBox.alpha = 1
        
        dobTextBox.isEnabled = true
        dobTextBox.alpha = 1
        
        dateOfVisitTextBox.isEnabled = true
        dateOfVisitTextBox.alpha = 1
        
    }
    
    func disableTextFields() {
        
        dobTextBox.isEnabled = false
        dobTextBox.alpha = 0.3
        dobTextBox.text = nil
        
        dateOfVisitTextBox.isEnabled = false
        dateOfVisitTextBox.alpha = 0.3
        dateOfVisitTextBox.text = nil
        
        projectNumberTextBox.isEnabled = false
        projectNumberTextBox.alpha = 0.3
        projectNumberTextBox.text = nil
        
        firstNameTextBox.isEnabled = false
        firstNameTextBox.alpha = 0.3
        firstNameTextBox.text = nil
        
        lastNameTextBox.isEnabled = false
        lastNameTextBox.alpha = 0.3
        lastNameTextBox.text = nil
        
        companyTextBox.isEnabled = false
        companyTextBox.alpha = 0.3
        companyTextBox.text = nil
        
        addressTextBox.isEnabled = false
        addressTextBox.alpha = 0.3
        addressTextBox.text = nil
        
        cityTextBox.isEnabled = false
        cityTextBox.alpha = 0.3
        cityTextBox.text = nil
        
        stateTextBox.isEnabled = false
        stateTextBox.alpha = 0.3
        stateTextBox.text = nil
        
        zipcodeTextBox.isEnabled = false
        zipcodeTextBox.alpha = 0.3
        zipcodeTextBox.text = nil
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
        stateTextBox.alpha = 1.0
        
        zipcodeTextBox.isEnabled = true
        zipcodeTextBox.alpha = 1.0
        
    }
    
    func displayAlert(_ title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let maxLength = 25
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }

}

