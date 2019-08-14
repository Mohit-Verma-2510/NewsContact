//
//  NewsFeedViewControllerView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 29/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// This is view class for NewsFeedView Controller
class NewsFeedViewControllerView: BaseView {
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    
    /// table view cell id
    let cellID = "NewsFeedCell"
    
    /// full data to display
    var newsData = [NewsViewModal]()
    
    /// Delegate for news action
    weak var delegate: NewsFeedActions?
    
    override func awakeFromNib() {
        
        /// Setting if view is configurable or not
        isViewConfigurable = true
    }
    
    ///Register TableView for XIB
    func tableViewInit(){
        let nib = UINib(nibName: "NewsFeedTableViewCell", bundle: nil)
        newsFeedTableView.register(nib, forCellReuseIdentifier: cellID)
        newsFeedTableView.separatorStyle = .none
    }
    
    /// setting tableview delegates
    func setTableViewDelegate(){
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource For News Feed
extension NewsFeedViewControllerView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? NewsFeedTableViewCell else {
            return UITableViewCell()
        }
        newsCell.selectionStyle = .none
        newsCell.delegate = self
        
        newsCell.newsTitleLbl.text = newsData[indexPath.row].newsTitle
        newsCell.newsDetailLbl.text = newsData[indexPath.row].newsDescription
        
        newsCell.favButton.tag = indexPath.row
        let isFavourite = newsData[indexPath.row].newsIsFav
        let imageName = isFavourite ? "fav_filled" : "fav_empty"
        newsCell.favButton.setImage(UIImage(named: imageName), for: .normal)
        
        if let imgURL =  URL(string: newsData[indexPath.row].newsUrlToImage) {
            ImageUtility.setImage(with: imgURL) { (image) in
                newsCell.newsImgView.image = image
            }
        }
        
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectTableView(data: newsData[indexPath.row])
    }
    
}

// MARK: - NewsFeedTVProtocol is for Favourite button action
extension NewsFeedViewControllerView: NewsFeedTVProtocol {
    /// action for favourite button
    func favButtonAction(_ senderIndex: Int) {
        delegate?.didFavouriteBtnClicked(senderIndex)
    }
}
