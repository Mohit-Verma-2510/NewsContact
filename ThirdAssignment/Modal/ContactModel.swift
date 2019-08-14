//
//  ContactModel.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

class ContactModel {
    
    var name: String
    var phone: String
    
    init(data:NSDictionary) {
        name = data["name"] as? String ?? ""
        phone = data["phone"] as? String ?? ""
    }
    
}
