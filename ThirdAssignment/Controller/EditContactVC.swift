//
//  EditContactVC.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class EditContactVC: BaseViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var oldData = ContactModel(data: [:])
    
    var delegate : StatusProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = oldData.name
        phoneTF.text = oldData.phone
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        
        let name  = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name!.isEmpty || phone!.isEmpty {
            print("empty")
        }
        else {
            let coreD = CoreDataOperation.shared
            coreD.delegate = self
            coreD.editContact(ename: CoreDataEntity.contactList, oldData: oldData, newData: ContactModel(data: ["name":name!,"phone":phone!]))
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismissViewController()
    }
    
    func dismissViewController(){
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK:-
extension EditContactVC : ContactProtocol {
    
    func contactSaved(msg: String) {
        oldData.name = (nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        oldData.phone = (phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        
        delegate?.success(msg: "")
        dismissViewController()
    }
    
}
