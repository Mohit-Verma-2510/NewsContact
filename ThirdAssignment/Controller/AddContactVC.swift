//
//  AddContactVC.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class AddContactVC: BaseViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var delegate : StatusProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let name  = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name!.isEmpty || phone!.isEmpty {
            print("empty")
        }
        else {
            let coreD = CoreDataOperation.shared
            coreD.delegate = self
            coreD.saveContact(ename: CoreDataEntity.contactList, data: [ "name" : name! , "phone" : phone! ] )
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- Extension for Contact
extension AddContactVC : ContactProtocol {
    
    func contactSaved(msg: String) {
        delegate?.success(msg: "success")
        dismiss(animated: true, completion: nil)
    }
    
}
