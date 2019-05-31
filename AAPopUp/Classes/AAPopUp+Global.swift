//
//  AAPopUp+Global.swift
//  AAPopUp
//
//  Created by Engr. Ahsan Ali on 07/02/2017.
//  Copyright (c) 2016 AA-Creations. All rights reserved.
//


// MARK: - UIView Extension
extension UIView {
    
    /// Bind view with super view
    func bindWithBounds() {
        guard let superview = self.superview else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
}


// MARK: - Keyboard Did Change listner
extension AAPopUp {
    
    /// register notificaitons for keyboard
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChange(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChange(_:)), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// Keyboard selector for changes
    ///
    /// - Parameter notification: NSNotification
    @objc func keyboardDidChange(_ notification: NSNotification) {
        
        let info = notification.userInfo!
        let keyboardHeight:CGFloat = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size.height
        let duration:Double = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        
        if notification.name == UIResponder.keyboardWillShowNotification && keyboardIsVisible == false{
            
            keyboardIsVisible = true
            
            UIView.animate(withDuration: duration, animations: { () -> Void in
                var frame = self.view.frame
                frame.size.height = frame.size.height - keyboardHeight
                self.view.frame = frame
            })
            
        } else if keyboardIsVisible == true && notification.name == UIResponder.keyboardWillShowNotification{
            
        }else {
            keyboardIsVisible = false
            
            UIView.animate(withDuration: duration, animations: { () -> Void in
                var frame = self.view.frame
                frame.size.height = frame.size.height + keyboardHeight
                self.view.frame = frame
            })
        }
    }
    
    
}
