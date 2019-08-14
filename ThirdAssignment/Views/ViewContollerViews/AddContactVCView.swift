//
//  AddContactVCView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 31/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Adding contact in core data
class AddContactVCView: BaseView {
    
    /// Textfields
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    /// Labels
    @IBOutlet weak var nameErrorLbl: UILabel!
    @IBOutlet weak var phoneErrorLbl: UILabel!
    
    /// Delegate
    weak var addDelegate: AddContactAction?
   
    override func awakeFromNib() {
        /// Setting if view is configurable or not
        isViewConfigurable = true
        
        /// delegate for textfields
        nameTF.delegate = self
        phoneTF.delegate = self
    }
    
    /// Action for saving data
    @IBAction func saveBtn(_ sender: Any) {
        self.endEditing(true)
        guard let name  = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let phone = phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            else {
                print("Error with textfield Value.")
                return
        }
        if !name.isEmpty && !phone.isEmpty {
           addDelegate?.didSaveData(data: ["name": name ,"phone": phone])
        }
    }
    
    /// Action for back button
    @IBAction func backBtn(_ sender: Any) {
        addDelegate?.didDismissViewController()
    }
}

// MARK: - UITextFieldDelegate
extension AddContactVCView: UITextFieldDelegate {
    /// When typing character
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// Phone TextFields
        if textField == phoneTF {
            let allowedCharacter = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacter.isSuperset(of: characterSet)
        }
        return true
    }
    
    /// When Text Will End Editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        /// Name TextFields
        if textField == nameTF {
            nameErrorLbl.isHidden = true
            if let name = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines), name.isEmpty {
                nameErrorLbl.text = "Please enter name"
                nameErrorLbl.isHidden = false
            }
            
        }
        /// Phone TextFields
        else if textField == phoneTF {
            phoneErrorLbl.isHidden = true
            if let phone = phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines), phone.isEmpty {
                phoneErrorLbl.text = "Please enter phone"
                phoneErrorLbl.isHidden = false
            }
        }
        else{
            assertionFailure("add the text field code here")
        }
    }
    
}
