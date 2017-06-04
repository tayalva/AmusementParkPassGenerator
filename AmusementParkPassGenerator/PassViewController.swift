//
//  PassViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 6/1/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit
import AudioToolbox

class PassViewController: UIViewController {

    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var entrantInfoLabel1: UILabel!
    @IBOutlet weak var entrantInfoLabel2: UILabel!
    @IBOutlet weak var entrantInfoLabel3: UILabel!
    @IBOutlet weak var testResults: UILabel!
    
    var accessGrantedSound: SystemSoundID = 0
    var accessDeniedSound: SystemSoundID = 1
 
    
    var guestName = PassCreator(entrant: selectedEntrant, name: nameForPass).entrantName
    var passType = PassCreator(entrant: selectedEntrant, name: "").type
    var rideAccess = PassCreator(entrant: selectedEntrant, name: "").rideAccess
    var foodDiscount = PassCreator(entrant: selectedEntrant, name: "").foodDiscount
    var merchDiscount = PassCreator(entrant: selectedEntrant, name: "").merchDiscount
    var entrantAccess = PassCreator(entrant: selectedEntrant, name: "")
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAccessGrantedSound()
        loadAccessDeniedSound()

        // Do any additional setup after loading the view.
    
        
        
        let joinedRideAccess = rideAccess.joined(separator: ", ")
        
        if guestName != " " {
            
        entrantNameLabel.text = guestName
        }
        
        passTypeLabel.text = passType
        entrantInfoLabel1.text = joinedRideAccess
        entrantInfoLabel2.text = "Food Discount: \(foodDiscount * 100)%"
        entrantInfoLabel3.text = "Merchandise Discount: \(merchDiscount * 100)%"
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func testButtons(_ sender: UIButton) {
        
        
        
        switch sender.tag {
            
        case 0: //office
            
            
            if OfficeAreaKiosk(entrantAccess) {
                
                testResults.backgroundColor = UIColor.green
                testResults.text = "Access Granted"
                playAccessGrantedSound()
                
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "Access Denied"
                playAccessDeniedSound()
            }
            
        case 1: // Amusement Area
            
            if AmusementAreaKiosk(entrantAccess) {
                
                testResults.backgroundColor = UIColor.green
                testResults.text = "Access Granted"
                playAccessGrantedSound()
                
                
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "Access Denied"
                playAccessDeniedSound()
            }
            
        case 2: // Kitchen Area
            
            if KitchenAreaKiosk(entrantAccess) {
                
                testResults.backgroundColor = UIColor.green
                testResults.text = "Access Granted"
                playAccessGrantedSound()
                
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "Access Denied"
                playAccessDeniedSound()
            }

            
        case 3: // Maintenance Area
            
            if MaintenanceAreaKiosk(entrantAccess) {
                
                testResults.backgroundColor = UIColor.green
                testResults.text = "Access Granted"
                playAccessGrantedSound()
                
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "Access Denied"
                playAccessDeniedSound()
            }

            
        case 4: // Ride Access
            
            if rideAccessKiosk(entrantAccess) {
                
                testResults.backgroundColor = UIColor.green
                testResults.text = "Access Granted"
                playAccessGrantedSound()
                
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "Access Denied"
              playAccessDeniedSound()
            }
            
        case 5: // Ride Control
            
            if RideControlAreaKiosk(entrantAccess) {
                
                testResults.backgroundColor = UIColor.green
                testResults.text = "Access Granted"
                playAccessGrantedSound()
                
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "Access Denied"
               playAccessDeniedSound()
            }
            
        case 6: // Food discount 
            
            if foodDiscount > 0.0 {
            
            testResults.backgroundColor = UIColor.green
                testResults.text = "Food Discount Available"
                playAccessGrantedSound()
            
            } else {
                
                testResults.backgroundColor = UIColor.red
                testResults.text = "No Food Discount Available"
                playAccessDeniedSound()
            }
            
        case 7: //Merch dscount
            
                if merchDiscount > 0.0 {
                    
                    testResults.backgroundColor = UIColor.green
                    testResults.text = "Merchandise Discount Available"
                    playAccessGrantedSound()
                    
                } else {
                    
                    testResults.backgroundColor = UIColor.red
                    testResults.text = "No Merchandise Discount Available"
                    playAccessDeniedSound()
            }

        default: break
            
           
        }
        
        
    }
    
    
    func loadAccessGrantedSound() {
        
        let pathToSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &accessGrantedSound)
    }
    
    func loadAccessDeniedSound() {
        
        let pathToSoundFile = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &accessDeniedSound)
    }
    
    func playAccessGrantedSound() {
        
        AudioServicesPlaySystemSound(accessGrantedSound)
        
    }
    
    func playAccessDeniedSound() {
        
        AudioServicesPlaySystemSound(accessDeniedSound)
    }
    
    
    
}
