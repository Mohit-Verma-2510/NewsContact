//
//  EditContactViewToViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Edit Vview controller Action
protocol EditContactAction: AnyObject {
    
    /// for saving data in core data
    func didSaveData(data:ContactModel)
    
    /// for dismissing view controller
    func didDismissViewController()
}
