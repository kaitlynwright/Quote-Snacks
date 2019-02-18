//
//  ViewController.swift
//  Quote Snacks
//
//  Created by Kaitlyn Wright on 2/18/19.
//  Copyright © 2019 Kaitlyn Wright. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var mainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if mySwitch.isOn {
            // handle on switch
        } else {
            // handle off switch
        }
        
    }

    @IBAction func mainButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "messageSegue", sender: sender)
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            // handle on switch
            /*mainButton.setTitle("Press For Encouragment", for: UIControl.State.normal)
            message = "  ENCOURAGMENT!!  "
            face = ":)"*/
            
        } else {
            // handle off switch
            /*mainButton.setTitle("Press For Discouragment", for: UIControl.State.normal)
            message = "  DISCOURAGMENT!!  "
            face = ":("*/
        }
    }
}

