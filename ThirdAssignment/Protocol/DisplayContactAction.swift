//
//  DisplayContactViewToViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Action for display contact
/// getting data or action from view to view controller
protocol DisplayContactAction: AnyObject{
    
    /// when table view cell is clicked
    func didselectTableCellAction(cellData:ContactModel)
    
    /// when add contact button is clicked
    func didAddButtonClicked()
    
    /// when slide to delete contact
    func didDeleteTableRow(deleteCell:ContactModel)
}
