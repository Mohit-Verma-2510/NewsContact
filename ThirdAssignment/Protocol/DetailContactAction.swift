//
//  DetailViewToViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Detail view controller action
protocol DetailContactAction: AnyObject {
    
    /// for dismissing view controller
    func didDismissViewController()
    
    /// when edit button is clicked
    func didEditButtonClicked()
}
