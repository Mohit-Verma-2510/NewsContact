//
//  ViewController.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class DisplayContactVC: UIViewController {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    var contactData = [ContactModel]()
    
    let cellID = "ContactCell"
    
    let coreD = CoreDataOperation.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllData()
        contactTableView.tableFooterView = UIView()
    }
    
    ///Getting all data
    func getAllData() {
        coreD.delegate = self
        coreD.getContact(ename: CoreDataEntity.contactList, data: [])
    }
    
    ///Action for add button
    @IBAction func addBtnAction(_ sender: Any) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "AddContactVC") as? AddContactVC else {
            print("error with AddContactVC ")
            return
        }
        destVC.delegate = self
        present(destVC, animated: true, completion: nil)
    }
    
    
}

//MARK:- Table view delegate and dat source
extension DisplayContactVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        contactCell.selectionStyle = .none
        let temp = contactData[indexPath.row]
        contactCell.textLabel?.text = temp.name + " - " + temp.phone
        return contactCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            coreD.delegate = self
            coreD.deleteContact(ename: CoreDataEntity.contactList, data: contactData[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailContactVC else {
            print("Error with DetailVC.")
            return
        }
        destVC.delegate = self
        let name = contactData[indexPath.row].name
        let phone = contactData[indexPath.row].phone
        destVC.data = ContactModel(data: ["name":name,"phone":phone])
        present(destVC, animated: true, completion: nil)
    }
    
}

//MARK:- Contact Protocol
extension DisplayContactVC : ContactProtocol{
    
    func contactDeleted (msg:String){
        getAllData()
    }
    
    func contactData (data:[ContactModel]) {
        self.contactData = data
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.reloadData()
    }
    
}

//MARK:- Status Protocol
extension DisplayContactVC : StatusProtocol {
    
    func success(msg: String) {
        getAllData()
    }
    
}

