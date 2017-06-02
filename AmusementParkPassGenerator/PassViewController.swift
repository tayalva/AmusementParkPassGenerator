//
//  PassViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Taylor Smith on 6/1/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {

    @IBOutlet weak var entrantName: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var entrantInfoLabel1: UILabel!
    @IBOutlet weak var entrantInfoLabel2: UILabel!
    @IBOutlet weak var entrantInfoLabel3: UILabel!
    
    var passType = PassCreator(entrant: selectedEntrant).type
    var rideAccess = PassCreator(entrant: selectedEntrant).rideAccess
    var foodDiscount = PassCreator(entrant: selectedEntrant).foodDiscount
    var merchDiscount = PassCreator(entrant: selectedEntrant).merchDiscount
    var guest: EntrantType?
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    

        
        passTypeLabel.text = passType
        
        let joined = rideAccess.joined(separator: ", ")
        
        print(joined)
        
        entrantInfoLabel1.text = joined
            
    
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

}
