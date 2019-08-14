//
//  NewsFeedViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import RealmSwift

/// This protocol is for realm news data
protocol RealmProtocol {
    func allData(data:Results<NewsObject>)
    func refreshRequired()
}
extension RealmProtocol {
    /// Making refreshRequired function as optional.
    func refreshRequired(){}
}

/// Home Page for news.
class NewsFeedViewController: BaseViewController {
    
    /// This is for custom view class for view controller
    var custview: NewsFeedViewControllerView?
    
    /// Realm instant variable
    let realInstance = RealmNews.shared
    
    /// this is all the data of news
    var allNewNews = [NewsObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        /// Setting up initial UI
        custview = self.view as? NewsFeedViewControllerView
        custview?.tableViewInit()
        custview?.setTableViewDelegate()
        custview?.startActivityIndicator()
        
        /// Checking for internet
        if Reachability.isConnectedToNetwork() {
            //let newsInterface = NewsFeedInterface.shared
            var newsInterface = NetworkFactory().create(with: .newsFeed)
            newsInterface.delegate = self
            newsInterface.getAllData(with: "")
        }
        else{
            /// No Internet
            print("Connect to internet")
        }
        
        ///Setting navigation title
        self.navigationItem.title = NSLocalizedString("News Feed", comment: "Title For news feed.")
        self.navigationController?.hidesBarsOnSwipe = false
        
    }
    
    ///  Testing for Communication from objc to swift 
    @objc func sampleFuncForObjc(){
        print("This is called from Objective C........")
    }
    
}

// MARK: - NewsDataProtocol For Getting data from API Call
extension NewsFeedViewController: NewsDataProtocol {
    
    /// Received Data from News API
    func sendData(data: [NewsObject]) {
        DispatchQueue.main.async {
            self.custview?.stopActivityIndicator()
            self.gettingDataForRealm(data: data)
            self.custview?.delegate = self
        }
    }
    
    /// Sorting data
    func gettingDataForRealm(data: [NewsObject]){
        realInstance.realmDelegate = self
        allNewNews = data
        realInstance.getAllData()
    }
    
}

// MARK: - NewsFeedViewToControllerProtocol For Getting Table View Did Select Action
extension NewsFeedViewController: NewsFeedActions {
    
    /// Action for table view row selected
    func didSelectTableView(data: NewsViewModal) {
        guard let destVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsFeedDetailViewController") as? NewsFeedDetailViewController else { return }
        destVC.data = data
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
    /// Action for favourite button
    func didFavouriteBtnClicked(_ senderIndex: Int) {
        guard let favN = custview?.newsData[senderIndex] else{ return }
        
        /// creating object for realm
        let tempObj = NewsObject()
        tempObj.title = favN.newsTitle
        tempObj.desc = favN.newsDescription
        tempObj.url = favN.newsURL
        tempObj.urlToImage = favN.newsUrlToImage
        tempObj.isFav = !favN.newsIsFav
        tempObj.content = favN.newsContent
        realInstance.updateData(data: tempObj)
        
        /// Sending local notifcation
        let localNotis = LocalNotificationManager()
        let tempDescription = "Marked favourite : \(tempObj.isFav)"
        localNotis.sendNotification(data: Notifications(id: "\(senderIndex)", title: "\(tempObj.title)", description: tempDescription, datetime: nil))
        custview?.newsData[senderIndex] = tempObj
        custview?.newsFeedTableView.reloadData()
    }
}

//MARK:- Realprotocol
extension NewsFeedViewController: RealmProtocol {
    /// Getting all data from realm
    func allData(data: Results<NewsObject>) {
        if data.count < 1 {
            /// If there is not data in realm then save it from API
            realInstance.saveData(allNews: allNewNews)
            realInstance.getAllData()
        }
        else {
            /// If realm contain data then load data from realm to view
            var newsArr = [NewsObject]()
            for news in data {
                newsArr.append(news)
            }
            custview?.newsData = newsArr
            custview?.newsFeedTableView.reloadData()
        }
        
    }
}

// MARK: - UITabBarDelegate
extension NewsFeedViewController: UITabBarControllerDelegate, UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("++++++++++++++++")
        print(item)
        print("++++++++++++++++")
        print(tabBar)
    }
}
