//
//  ContactVCView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 31/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// View class for Display View Controller
class DisplayContactVCView: BaseView {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    /// Table view cell id
    let cellID = "ContactCell"

    /// All contact data
    var contactData = [ContactViewModel]()
    
    /// Delegate for actions
    weak var displayDelegate: DisplayContactAction?
    
    override func awakeFromNib() {
        
        /// Setting if view is configurable or not
        isViewConfigurable = false
        
        /// Setting table view delegate and datasource
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        /// setting tableview bottom border lines
        contactTableView.tableFooterView = UIView()
    }
    
    func viewInit(){
    }
    
    /// Setting from View Controller
    ///
    /// - Parameter data: Full Data from core data
    func setData(data:[ContactModel]){
        print("Reloaded is called")
        contactData = data
        contactTableView.reloadData()
    }
    
    ///Action for add button
    @IBAction func addBtnAction(_ sender: Any) {
        displayDelegate?.didAddButtonClicked()
    }
    
}

//MARK:- Table view delegate and dat source
extension DisplayContactVCView : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        contactCell.selectionStyle = .none
        let temp = contactData[indexPath.row]
        contactCell.textLabel?.text = temp.fullName + " - " + temp.mobile
        return contactCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let deletedCellData = contactData[indexPath.row] as? ContactModel else { return }
            displayDelegate?.didDeleteTableRow(deleteCell: deletedCellData)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCellData = contactData[indexPath.row] as? ContactModel else { return }
        displayDelegate?.didselectTableCellAction(cellData: selectedCellData)
    }
    
}

