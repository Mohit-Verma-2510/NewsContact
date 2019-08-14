//
//  EditContactVC.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Thsi class is for editing contact
class EditContactVC: BaseViewController {
    
    /// data before editing
    var oldData = ContactModel(data: [:])
    
    /// Delegate
    var delegate: StatusProtocol?
    
    /// Custom view for this view controller
    var customEditView: EditContactVCView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customEditView = self.view as? EditContactVCView
        customEditView?.setValues(oldData: oldData)
        customEditView?.editDelegate = self
    }
    
    ///Common func to dismiss
    func dismissViewController(){
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- ContactProtocol for checking status of code data
extension EditContactVC : ContactProtocol {
    func contactSaved(msg: String) {
        //Using reference sending value to before VC
        guard let updatedName = customEditView?.nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let updatedPhone = customEditView?.phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return
        }
        oldData.name = updatedName
        oldData.phone = updatedPhone
        
        delegate?.success(msg: "success.")
        dismissViewController()
    }
    
}

// MARK: - EditContactViewToViewController
extension EditContactVC: EditContactAction{
    
    /// Dismiss action
    func didDismissViewController() {
        dismissViewController()
    }
    
    /// Saving data action
    func didSaveData(data: ContactModel) {
        /// setting data
        let coreData = CoreDataOperationForContact.shared
        coreData.delegate = self
        coreData.editContact(ename: CoreDataEntity.contactList,
                          oldData: oldData,
                          newData: data)
    }
    
}

