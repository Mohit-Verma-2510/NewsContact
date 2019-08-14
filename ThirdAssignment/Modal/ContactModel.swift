//
//  ContactModel.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Model class for contact Data
class ContactModel {
    
    /// First Name
    var firstname: String
    
    /// Last Name
    var lastName: String
    
    /// Full Name
    var name: String
    
    /// Phone number
    var phone: String
    
    /// initialize using dictionary
    init(data:NSDictionary) {
        name = data["name"] as? String ?? ""
        phone = data["phone"] as? String ?? ""
        firstname = data["firstname"] as? String ?? ""
        lastName = data["lastName"] as? String ?? ""
    }
}
