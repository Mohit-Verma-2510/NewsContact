//
//  ViewController.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// This is for displaying ccontact
class DisplayContactVC: UIViewController {
    
    /// Core data reference
    let coreDataRef = CoreDataOperationForContact.shared
    
    /// Custom view for this view contoller
    var customControllerView: DisplayContactVCView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// intial setup
        customControllerView = self.view as? DisplayContactVCView
        customControllerView?.displayDelegate = self
        customControllerView?.viewInit()
        
        /// Getting data from core data
        getAllData()
    }
    
    /// Getting all data response will come in ContactData Func
    func getAllData() {
        coreDataRef.delegate = self
        coreDataRef.getContact(ename: CoreDataEntity.contactList, data: [])
    }
    
}

//MARK:- Contact Protocol
extension DisplayContactVC: ContactProtocol{
    
    /// Sending data to View.
    ///
    /// - Parameter data: Data coming from Core Data
    func contactData (data:[ContactModel]) {
        if data.count == 0 {
            BaseAlert.showMessage(AlertMessage.noDataFound)
        }
        customControllerView?.setData(data: data)
    }
    
    /// If contact is deleted then update data for UI
    ///
    /// - Parameter msg: message for user
    func contactDeleted (msg:String){
        print("deleted and protocvolis called")
        getAllData()
    }
    
}

//MARK:- Status Protocol From Add View Controller
extension DisplayContactVC: StatusProtocol {
    func success(msg: String) {
        getAllData()
    }
}

// MARK: - Getting data from DisplayContactVCView.
extension DisplayContactVC: DisplayContactAction {
    
    /// Action for table view cell
    ///
    /// - Parameter cellData: Data for selected cell
    func didselectTableCellAction(cellData: ContactModel) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailContactVC else {
            print("Error with DetailVC.")
            return
        }
        destVC.delegate = self
        let name = cellData.name
        let phone = cellData.phone
        destVC.data = ContactModel(data: ["name":name,"phone":phone])
        present(destVC, animated: true, completion: nil)
    }
    
    /// Action for add button
    func didAddButtonClicked() {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "AddContactVC") as? AddContactVC else {
            print("error with AddContactVC ")
            return
        }
        destVC.delegate = self
        present(destVC, animated: true, completion: nil)
    }
    
    /// Delete Cell Action
    ///
    /// - Parameter deleteCell: data for particular cell
    func didDeleteTableRow(deleteCell:ContactModel){
        print("Delete is called")
        coreDataRef.deleteContact(ename: CoreDataEntity.contactList, data: deleteCell)
    }
    
}

