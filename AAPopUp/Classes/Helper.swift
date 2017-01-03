//
//  Helper.swift
//  AAPopUp
//
//  Created by Engr. Ahsan Ali on 12/29/2016.
//  Copyright (c) 2016 AA-Creations. All rights reserved.
//


// MARK:- AAPopUps
open class AAPopUps<S, V>: AAPopUp {
    open let _storyboard: String?
    open let _id: String
    
    public init(_ storyboard: String? = nil, identifier: String) {
        self._storyboard = storyboard
        self._id = identifier
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


/// AAPopUp options
open class AAPopUpOptions: NSObject {
    
    open var storyboardName: String?
    open var dismissTag: Int?
    open var cornerRadius: CGFloat = 4.0
    open var animationDuration = 0.3
    open var backgroundColor = UIColor.black.withAlphaComponent(0.7)
    
    
}
