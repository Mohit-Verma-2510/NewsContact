//
//  DetailContactVCView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 31/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// This view is for details contact view controller
class DetailContactVCView: BaseView {
    
    /// Labels
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    /// Delegate
    weak var detailDeleage: DetailContactAction?
    
    override func awakeFromNib() {
        /// setting view is configurable or not
        isViewConfigurable = true
    }
    
    /// Setting Value for labels
    func changeVal(data:ContactViewModel){
        nameLbl.text  = "Name : " + data.fullName
        phoneLbl.text = "Phone : " + data.mobile
    }
    
    /// Back button action
    @IBAction func backBtn(_ sender: Any) {
        detailDeleage?.didDismissViewController()
    }
    
    /// Edit button action
    @IBAction func editBtnAction(_ sender: Any) {
        detailDeleage?.didEditButtonClicked()
    }
    
}
