//
//  AddContactVC.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// This class is for Adding contact
class AddContactVC: BaseViewController {
    
    /// Delegate to check contyact is added or not
    var delegate : StatusProtocol?
    
    /// Custom view for this view controller
    var customAddView: AddContactVCView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// initial setup
        customAddView = self.view as? AddContactVCView
        customAddView?.addDelegate = self
    }
}

//MARK:- Extension for Contact
extension AddContactVC: ContactProtocol {
    func contactSaved(msg: String) {
        delegate?.success(msg: "success")
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - AddContactAction
extension AddContactVC: AddContactAction {
    /// Saving data in coore data
    ///
    /// - Parameter data: data to save in core data
    func didSaveData(data: NSDictionary){
        let coreD = CoreDataOperationForContact.shared
        coreD.delegate = self
        coreD.saveContact(ename: CoreDataEntity.contactList, data:  data)
    }
    
    
    /// Dismissing view controller
    func didDismissViewController(){
        dismiss(animated: true, completion: nil)
    }
    
}
