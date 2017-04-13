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
        
        
        do {
        try Employee(firstName: nil, lastName: nil, address: "1232", city: "HB", state: "CA", zip: 92648)
        
        } catch UserError.missingFullName  {
            print("Please enter your full name")
        } catch {
            print(error)
        }
        
        do {
            
            try Employee(firstName: "name", lastName: "name", address: "12", city: "HB", state: nil, zip: 9298)
        } catch UserError.missingFullAddress {
            
            print("Please provide your full address.")
        } catch {
            
            print(error)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

