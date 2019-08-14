//
//  BaseViewController.swift
//  VCPresent
//
//  Created by Mohit Verma on 11/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
    }
    
}

//MARK:- Transition Delegate For View Controller
extension BaseViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return AnimationController(animationDuration: 0.6, animationType: .present, startingPoint: self.view.center)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return AnimationController(animationDuration: 0.6, animationType: .dismiss, startingPoint: self.view.center)
    }
    
    
}

