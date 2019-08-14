//
//  DisplayContactViewToViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol DisplayContactAction: AnyObject{
    func didselectTableCellAction(cellData:ContactModel)
    func didAddButtonClicked()
    func didDeleteTableRow(deleteCell:ContactModel)
}
