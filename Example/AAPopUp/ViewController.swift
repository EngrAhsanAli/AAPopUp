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
 
    let popup: AAPopUp = AAPopUp(getViewController("Main", id: "DemoPopup"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // MARK:- View Did Load Here
        
//        popup.absoluteHeight = 500
        
        
        let dynamicLabel = UILabel()
        dynamicLabel.text = "Dynamic Label"
        dynamicLabel.sizeToFit()
        
        popup.viewController.view.addSubview(dynamicLabel)
        
        let label = popup.viewWithTag(10) as! UILabel
        label.text = "Welcome to AAPopUp!"
        
        
        
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

