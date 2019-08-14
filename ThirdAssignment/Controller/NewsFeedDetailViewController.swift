//
//  NewsFeedDetailViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import WebKit

class NewsFeedDetailViewController: BaseViewController {
    
    let cellID = "NewsDetailCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = NewsDataModal(data: [:])
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:data.url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func tableViewSetting(){
        let nib = UINib(nibName: "NewsFeedDetailTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellID)
        
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension NewsFeedDetailViewController: WKUIDelegate {
    
}

// MARK: - UITableViewDelegate , UITableViewDataSource
extension NewsFeedDetailViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? NewsFeedDetailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.newsLbl.text = data.title
        }
        else if indexPath.row == 1{
            cell.newsLbl.text = data.description
        }
        
        return cell
    }
    
    
}
