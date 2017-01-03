//
//  ViewController.swift
//  AAPopUp
//
//  Created by Engr. Ahsan Ali on 12/29/2016.
//  Copyright (c) 2016 AA-Creations. All rights reserved.
//

import UIKit
import AAPopUp

class ViewController: UIViewController {

    
    var popup: AAPopUp = AAPopUp(popup: .demo2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // MARK:- View Did Load Here
        
        let label = popup.viewWithTag(10) as! UILabel
        label.text = "Demo Label"
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func triggerPopup(_ sender: UIButton) {

        
        popup.present { popup in
            
            // MARK:- View Did Appear Here
            
            popup.dismissWithTag(9)
            
            
        }
        
        
    }
}

