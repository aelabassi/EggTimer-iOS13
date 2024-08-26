//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 4
    let mediumTime = 8
    let hardTime = 16
    @IBAction func hardenessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if (hardness == "Hard"){
            print(hardTime)
        }else if (hardness == "Medium"){
            print(mediumTime)
        }else{
            print(softTime)
        }
    
        
    }
    
}
