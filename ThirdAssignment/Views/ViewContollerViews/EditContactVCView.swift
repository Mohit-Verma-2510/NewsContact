//
//  EditContactVCView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 31/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit



/// This view is for Edit Contact View Controller
class EditContactVCView: BaseView {
    
    /// textfields
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    /// Labels
    @IBOutlet weak var nameErrorLbl: UILabel!
    @IBOutlet weak var phoneErrorLbl: UILabel!
    
    /// Delegate
    weak var editDelegate: EditContactAction?
    
    override func awakeFromNib() {
        /// setting view is configurable or not
        isViewConfigurable = true
        
        /// delegate for textfields
        nameTF.delegate = self
        phoneTF.delegate = self
    }
    
    /// Setting value for labels
    func setValues(oldData: ContactViewModel){
        nameTF.text = oldData.fullName
        phoneTF.text = oldData.mobile
    }
    
    /// Upadte Button actions
    @IBAction func updateBtn(_ sender: Any) {
        self.endEditing(true)
        guard let name  = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let phone = phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                print("Error with name or phone text field.")
                return
        }
        
        if !name.isEmpty && !phone.isEmpty {
            editDelegate?.didSaveData(data: ContactModel(data: ["name": name ,"phone": phone]))
        }
    }
    
    /// Back button action
    @IBAction func backBtn(_ sender: Any) {
        editDelegate?.didDismissViewController()
    }
    
}

// MARK: - UITextFieldDelegate
extension EditContactVCView: UITextFieldDelegate {
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
