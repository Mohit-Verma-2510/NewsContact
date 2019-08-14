//
//  BaseViewController.swift
//  VCPresent
//
//  Created by Mohit Verma on 11/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/**
 - About :
    -  This Class is for Animation.
    - To Apply : Inherit BaseViewController instead of UIViewController in controller.
 */
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
    }
}

//MARK:- Transition Delegate For View Controller
extension BaseViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CircularAnimationController(animationDuration: 0.6, animationType: .present, startingPoint: self.view.center)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CircularAnimationController(animationDuration: 0.6, animationType: .dismiss, startingPoint: self.view.center)
    }
    
}

