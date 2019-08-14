//
//  AddContactViewToViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol AddContactAction {
    func didSaveData(data: NSDictionary)
    func didDismissViewController()
}
