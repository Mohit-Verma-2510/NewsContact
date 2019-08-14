//
//  ContactProtocol.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit


protocol ContactProtocol {
    
    func contactError (errMsg: String)
    
    func contactData (data:[ContactModel])
    
    func contactSaved (msg:String)
    
    func contactDeleted (msg:String)
    
}

extension ContactProtocol {
    
    func contactError (errMsg: String) {
        
        let window = UIApplication.shared.keyWindow
        
        let alert = UIAlertController(title: "Error", message: errMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        window?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    func contactData (data:[ContactModel]) {}
    
    func contactSaved (msg:String) {}
    
    func contactDeleted (msg:String) {}
    
}
