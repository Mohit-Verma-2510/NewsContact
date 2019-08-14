//
//  NewsFeedTableViewCell.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var newsBackgroundView: CustomViews!
    @IBOutlet weak var newsImgView: UIImageView!
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDetailLbl: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var delegate: NewsFeedTVProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsBackgroundView.boxShadow()
    }
    @IBAction func favBtnAction(_ sender: UIButton) {
        delegate?.favButtonAction(sender.tag)
    }
    
}


/*
protocol NewsModals {
    var newsTitle: String {get}
}

extension NewsDataModal: NewsModals {
    var newsTitle: String  {
        return title
    }
}


*/
