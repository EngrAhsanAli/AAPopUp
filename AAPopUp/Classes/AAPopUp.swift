//
//  AAPopUp.swift
//  AAPopUp
//
//  Created by Engr. Ahsan Ali on 12/29/2016.
//  Copyright (c) 2016 AA-Creations. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

open class AAPopUp: UIViewController {
    
    open static var globalOptions = AAPopUpOptions()
    
    var options: AAPopUpOptions!
    
    var popupViewController: UIViewController!
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    public convenience init(popup: AAPopUps<String?, String>, withOptions options: AAPopUpOptions? = nil) {
        
        self.init()
        
        initOptions(options)
        
        let vc = popup.getViewController(popup)
        initPopUp(vc)
        
    }
    
    public convenience init(popup: UIViewController, withOptions options: AAPopUpOptions? = nil) {
        
        self.init()
        
        initOptions(options)
        initPopUp(popup)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentPopUpView()
        dismissWithTag(options.dismissTag)
        
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.popupViewController.view.center = self.view.center
        self.popupViewController.view!.layoutIfNeeded()
        self.view!.setNeedsLayout()
        
    }
    
    func getViewController(_ popup: AAPopUps<String?, String>) -> UIViewController {
        
        var storyboard_id: String!
        if let storyboard = popup._storyboard {
            storyboard_id = storyboard
        }
        else if let storyboard = options.storyboardName {
            storyboard_id = storyboard
        }
        else {
            fatalError("AAPopUp - Invalid Storyboard name. Aborting ...")
        }
        
        let storyboard: UIStoryboard = UIStoryboard(name: storyboard_id, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: popup._id)
    }
    
    func initOptions(_ options: AAPopUpOptions?) {
        if let option = options {
            self.options = option
        }
        else {
            self.options = AAPopUp.globalOptions
        }
    }
    
    func initPopUp(_ viewController: UIViewController) {
        
        let contentView = viewController.view.subviews[0].bounds
        viewController.view.bounds = contentView
        
        guard !contentView.isEmpty else {
            fatalError("AAPopUp - All child views must be encapsulate in a single UIView instace. Aborting ...")
        }
        
        if #available(iOS 9.0, *) {
            self.loadViewIfNeeded()
        }
        popupViewController = viewController
        let scrollView = TPKeyboardAvoidingScrollView(frame: self.view.bounds)
        scrollView.contentSize = view.bounds.size
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view!.addSubview(scrollView)
        
        addConstrantPin(scrollView, view2: view!)
        
        let scrollContentView = UIView(frame: scrollView.bounds)
        scrollView.addSubview(scrollContentView)
        
        addConstrantPin(scrollContentView, view2: scrollView)
        
        self.addChildViewController(popupViewController)
        scrollContentView.addSubview(popupViewController.view!)
        popupViewController.didMove(toParentViewController: self)
        
        modalPresentationStyle = .overFullScreen
        popupViewController.view.layer.cornerRadius = options.cornerRadius
        popupViewController.view.layer.masksToBounds = true
        
        togglePopup() // First Invisible Animaiton
    }
    
    func addConstrantPin(_ view1: Any, view2: Any) {
        
        let attrs: [NSLayoutAttribute] = [.top, .bottom, .trailing, .leading]
        attrs.forEach { (attr) in
            let constraint = NSLayoutConstraint(item: view1, attribute: attr, relatedBy: .equal, toItem: view2, attribute: attr, multiplier: 1.0, constant: 0.0)
            self.view.addConstraint(constraint)
        }
    }
    
    func togglePopup(_ show: Bool = false) {
        if show {
            self.popupViewController.view.alpha = 1.0
            self.view.backgroundColor = options.backgroundColor
            self.popupViewController.view.transform = CGAffineTransform.identity
            return
        }
            
        self.popupViewController.view.alpha = 0.0
        self.view.backgroundColor = options.backgroundColor.withAlphaComponent(0.0)
        self.popupViewController.view.transform = CGAffineTransform.identity.scaledBy(x: 0.6, y: 0.6)
        
    }
    


}


//MARK:- helper functions

extension AAPopUp {

    open func viewWithTag(_ tag: Int) -> UIView? {
        return view.viewWithTag(tag)
    }
    
    open func dismissWithTag(_ tag: Int?) {
        if let dismissTag = tag {
            if let button = view.viewWithTag(dismissTag) as? UIButton {
                button.addTarget(self, action:#selector(AAPopUp.dismissPopup), for: .touchUpInside)
            }
        }
    }
    
    func dismissPopup() {
        dismissPopUpView()
    }

    open func present(completion: ((_ popup: AAPopUp) -> ())?) {
        
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("AAPopUp - Application key window not found. Please check UIWindow in AppDelegate.")
        }
        
        root.present(self, animated: false, completion: {
            completion?(self)
        })
        
    }
    
    func presentPopUpView() {
        UIView.animate(withDuration: options.animationDuration, delay: 0, animations: {() -> Void in
            self.togglePopup(true)
        }, completion: nil)
    }
    
    open func dismissPopUpView(completion: (() -> ())? = nil) {
        UIView.animate(withDuration: options.animationDuration, animations: {() -> Void in
            self.togglePopup()
        }, completion: {(finished: Bool) -> Void in
            
            self.presentingViewController!.dismiss(animated: false, completion: completion)
            
        })
    }
    
    
}
