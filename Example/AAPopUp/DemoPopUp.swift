//
//  DemoPopUp.swift
//  AAPopUp
//
//  Created by Muhammad Ahsan on 03/01/2017.
//  Copyright © 2017 AA-Creations. All rights reserved.
//

import UIKit
import AAPopUp

class DemoPopUp: UIViewController {
    
    @IBOutlet weak var demoLabel: UILabel!
    @IBOutlet weak var demoTextField: UITextField!
    @IBOutlet weak var demoTextView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        demoLabel.text = "Demo Label"
        demoTextField.text = "Demo TextField"
        demoTextView.text = "Demo TextView"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func demoButtonAction(_ sender: Any) {
        
        let alert = UIAlertView(title: "Alert", message: "Simple alert over AAPopUp!", delegate: nil, cancelButtonTitle: "OK")
        alert.performSelector(onMainThread: #selector(alert.show), with: nil, waitUntilDone: false)
    }
 
    @IBAction func closeAction(_ sender: Any) {
        
        // MARK:- Dismiss action
        
        //self.dismiss(animated: true, completion: nil)
        
    }
    
}



