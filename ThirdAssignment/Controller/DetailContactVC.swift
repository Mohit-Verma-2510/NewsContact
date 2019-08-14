//
//  DetailVC.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 07/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Showing detail for contact
class DetailContactVC: BaseViewController {
    
    var delegate : StatusProtocol?
    
    /// Geeting data from previous controller
    var data = ContactModel(data: [:])
    
    /// Custom view for this view controller
    var custDetailView: DetailContactVCView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// initial setup
        custDetailView = self.view as? DetailContactVCView
        custDetailView?.detailDeleage = self
        
        ///Setting data in views
        custDetailView?.changeVal(data: data)
    }
}

//MARK:- Status Protocol
extension DetailContactVC : StatusProtocol{
    func success(msg: String) {
        self.delegate?.success(msg: "")
        custDetailView?.changeVal(data: data)
    }
}

// MARK: - DetailViewToViewController
extension DetailContactVC: DetailContactAction {
    /// Dismiss view controller acttion
    func didDismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    /// Edit button Action
    func didEditButtonClicked() {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "EditContactVC") as? EditContactVC else {
            print("Error with EditContactVC")
            return
        }
        destVC.delegate = self
        destVC.oldData = data
        present(destVC, animated: true, completion: nil)
    }
    
}
