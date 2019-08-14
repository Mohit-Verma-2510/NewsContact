//
//  FavouriteNewsView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 07/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// This view is for favourite view controller
class FavouriteNewsView: BaseView {
    
    /// cell id for table
    var cellID = "FavouriteCell"
    
    @IBOutlet weak var favouriteNewTableView: UITableView!
    
    /// favourite data
    var favouriteNewsData = [NewsFavViewModal]()
    
    override func awakeFromNib() {
        
        /// Starting activity indicator
        startActivityIndicator()
        
        /// Setting view is configurable or not
        isViewConfigurable = true
        
        /// Setting tableview cell
        let nib = UINib(nibName: "FavouriteTableViewCell", bundle: nil)
        favouriteNewTableView.register(nib, forCellReuseIdentifier: cellID)
        
        /// Setting table view delegate and datasource
        favouriteNewTableView.delegate = self
        favouriteNewTableView.dataSource = self
        
        /// Setting table view cell bottm border
        favouriteNewTableView.tableFooterView = UIView()
    }
    
    /// Setting data and reloading
    func setTableData(data:[NewsFavViewModal]){
        stopActivityIndicator()
        favouriteNewsData = data
        favouriteNewTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FavouriteNewsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteNewsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FavouriteTableViewCell else {
            return UITableViewCell()
        }
        newsCell.selectionStyle = .none
        let formatString = NSMutableAttributedString()
        formatString.bold(favouriteNewsData[indexPath.row].newsFavTitle + "\n \n")
        .normal(favouriteNewsData[indexPath.row].newsFavDescription)
        
        newsCell.newsTitleLbl.attributedText = formatString
        return newsCell
    }
}

// MARK: - Text Utility
extension NSMutableAttributedString {
    /// bold text append
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "AvenirNext-Medium", size: 14)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    /// Noram text append
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
