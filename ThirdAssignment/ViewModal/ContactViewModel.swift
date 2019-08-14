//
//  ContactViewModel.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 13/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol ContactViewModel {
    /// Name
    var fullName: String { get }
    
    /// Phone
    var mobile: String { get }
}

extension ContactModel: ContactViewModel {
    /// Setting value for full name
    var fullName: String {
       return name
    }
    
    /// Setting value for mobile
    var mobile: String {
        return phone
    }
}
