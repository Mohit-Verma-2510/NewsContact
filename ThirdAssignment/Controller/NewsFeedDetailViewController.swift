//
//  NewsFeedDetailViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// This is web view class for news details
class NewsFeedDetailViewController: BaseViewController {
    
    /// Contains all data
    var data: NewsViewModal?
    
    /// Custom view refernce for this view controller
    var custViewDetail: NewsFeedDetailViewControllerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// initial set up for webview
        custViewDetail = self.view as? NewsFeedDetailViewControllerView
        custViewDetail?.createWebView()
        
        /// Setting URL to web view
        guard let tempURL = data?.newsURL, let myURL = URL(string:tempURL) else {
            print("Error with URL.")
            return
        }
        
        /// loading web view with url
        custViewDetail?.loadWebView(with: myURL)
    }
    
}
