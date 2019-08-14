//
//  Constant.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 05/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Core Data Table Name
struct CoreDataEntity {
    static let contactList = "ContactList"
}

//MARK:- Common Alert
struct BaseAlert {
    
    private static func displayAlert(_ title: String, _ message: String){
        let window = UIApplication.shared.keyWindow
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    static func showError(message: String) {
        displayAlert("Error", message)
    }
    
    static func showMessage(_ message: String) {
        displayAlert("Message", message)
    }
    
}


struct AlertMessage {
    static let noDataFound = "No data found."
}
