//
//  NewsFeedViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

protocol viewActions {
    func didTapOnButton()
}


class NewsFeedViewController: UIViewController {
    
    let cellID = "NewsFeedCell"
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    
    var data = [NewsDataModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        (self.view as? NewsFeedViewControllerView)?.temp = ""
//        (self.view as? NewsFeedViewControllerView)?.delegate = self as! viewActions

//        data = NewsFeedViewModal.shared.getData()
        let newsVM = NewsFeedViewModal.shared
        newsVM.delegate = self
        newsVM.getAllNewsData()
        
        ///Register TableView for XIB
        let nib = UINib(nibName: "NewsFeedTableViewCell", bundle: nil)
        newsFeedTableView.register(nib, forCellReuseIdentifier: cellID)
        
        newsFeedTableView.separatorStyle = .none
        
        ///Setting navigation title
        self.navigationItem.title = NSLocalizedString("News Feed", comment: "Title For news feed.")
        self.navigationController?.hidesBarsOnSwipe = false
        
        /*
        ///Calling Objective function from swift by creating bridge
        let obj = SampleViewController()
        obj.printSomeData()
        */
        
    }
    
    @objc func sampleFuncForObjc(){
        print("This is called from Objective C........")
    }
    
    func funcForTesting() -> Int{
        return 10
    }
    
}



// MARK: - UITableViewDelegate, UITableViewDataSource For News Feed
extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? NewsFeedTableViewCell else {
            return UITableViewCell()
        }
        newsCell.selectionStyle  = .none
        newsCell.delegate = self
        
        newsCell.newsTitleLbl.text = data[indexPath.row].title
        newsCell.newsDetailLbl.text = data[indexPath.row].description
        
        newsCell.favButton.tag = indexPath.row
        let isFav = data[indexPath.row].isFav
        switch isFav {
        case true:
            newsCell.favButton.setImage(UIImage(named: "fav_filled"), for: .normal)
            break
        case false:
            newsCell.favButton.setImage(UIImage(named: "fav_empty"), for: .normal)
            break
        }
        
        return newsCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let destVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsFeedDetailViewController") as? NewsFeedDetailViewController else { return }
        
        destVC.data = self.data[indexPath.row]
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
}

extension NewsFeedViewController: NewsFeedTVProtocol {
    func favButtonAction(_ senderIndex: Int) {
        let localNotis = LocalNotificationManager()
        let temp = data[senderIndex]
        switch temp.isFav {
        case true:
            localNotis.sendNotification(data: Notification(id: "\(senderIndex)", title: "Favourite News", description: "false", datetime: nil))
            temp.isFav = false
            break
        case false:
            localNotis.sendNotification(data: Notification(id: "\(senderIndex)", title: "Favourite News", description: "true", datetime: nil))
            temp.isFav = true
            break
        }
        data[senderIndex] = temp
        newsFeedTableView.reloadData()
    }
}


extension NewsFeedViewController: NewsDataProtocol {
    
    func sendData(data: [NewsDataModal]) {
        self.data = data
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        newsFeedTableView.reloadData()
    }
    
}
