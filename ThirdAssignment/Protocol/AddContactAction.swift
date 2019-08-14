//
//  AddContactViewToViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Add view controller Action
protocol AddContactAction: AnyObject{
    
    /// for sdaving data in core data
    func didSaveData(data: NSDictionary)
    
    /// for dismissing view controller after saving
    func didDismissViewController()
}
