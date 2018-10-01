//
//  AAPopUp+Helper.swift
//  AAPopUp
//
//  Created by Engr. Ahsan Ali on 12/29/2016.
//  Copyright (c) 2016 AA-Creations. All rights reserved.
//


/// AAPopUp options
open class AAPopUpOptions: NSObject {
    
    open var dismissTag: Int?
    open var cornerRadius: CGFloat = 4.0
    open var animationDuration = 0.2
    open var backgroundColor = UIColor.black.withAlphaComponent(0.7)

}
