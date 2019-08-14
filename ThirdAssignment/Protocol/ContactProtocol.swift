
//
//  ContactProtocol.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit


/// This protocol is for checking all contact operation is done or not.
protocol ContactProtocol: AnyObject {
    
    /// for sending error
    func contactError (errMsg: String)
    
    /// for sending all data
    func contactData (data:[ContactModel])
    
    /// saving contact status
    func contactSaved (msg:String)
    
    /// delete contact status
    func contactDeleted (msg:String)
}
/// Setting default 
extension ContactProtocol {
    
    /// Alert will if any error in core data
    func contactError (errMsg: String) {
        BaseAlert.showError(message: errMsg)
    }
    
    /// Setting optional functions
    func contactData (data:[ContactModel]) {}
    func contactSaved (msg:String) {}
    func contactDeleted (msg:String) {}
}
