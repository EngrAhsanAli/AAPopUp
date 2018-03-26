//
//  Constants.swift
//  AAPopUp
//
//  Created by Muhammad Ahsan on 30/12/2016.
//  Copyright © 2016 AA-Creations. All rights reserved.
//

import AAPopUp

/// Get view controller from given AAPopUps object
///
/// - Parameter popup: AAPopUps object
/// - Returns: UIViewController
func getViewController(_ storyboard: String, id: String) -> UIViewController {
    let storyboard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: id)
}

