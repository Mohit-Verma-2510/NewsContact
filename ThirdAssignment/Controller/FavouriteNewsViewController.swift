//
//  FavouriteNewsViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 06/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import RealmSwift

/// This is for diplaying favourite news marked by user
class FavouriteNewsViewController: UIViewController {
    
    /// Custom view for this view controller
    var custView: FavouriteNewsView?
    
    /// Realm instance
    let realmInstance = RealmNews.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Initial setup
        custView = self.view as? FavouriteNewsView
        realmInstance.realmDelegate = self
    }
    
    /// Reloading data
    override func viewWillAppear(_ animated: Bool) {
        realmInstance.getAllData()
    }
}

// MARK: - RealmProtocol
extension FavouriteNewsViewController: RealmProtocol {
    /// Getting all data from realm
    func allData(data:Results<NewsObject>){
        var favouriteNewsData = [NewsObject]()
        favouriteNewsData.removeAll()
        favouriteNewsData = data.filter{ $0.isFav }
        if favouriteNewsData.count == 0 {
            BaseAlert.showMessage(AlertMessage.noDataFound)
        }
        custView?.setTableData(data: favouriteNewsData)
    }
}
