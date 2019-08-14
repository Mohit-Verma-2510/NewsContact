//
//  NewsFeedDetailTableViewCell.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class NewsFeedDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var newsLbl: CustomLabelView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsLbl.addShadow()
    }
    
}
