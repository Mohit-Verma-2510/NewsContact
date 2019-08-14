//
//  NewsFeedDetailViewControllerView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 30/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import WebKit

/// This class is for webview for news
class NewsFeedDetailViewControllerView: BaseView {
    
    /// web view for view
    var webView: WKWebView!
    
    /// Initalizing web view
    func createWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), configuration: webConfiguration)
        webView.navigationDelegate = self
        self.addSubview(webView)
    }
    
    /// Loading web view
    func loadWebView(with pageURL:URL) {
        startActivityIndicator()
        let myRequest = URLRequest(url: pageURL)
        webView.load(myRequest)
    }
    
}

//MARK: - Delegate for web view
extension NewsFeedDetailViewControllerView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopActivityIndicator()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        stopActivityIndicator()
        BaseAlert.showError(message: "Failed to load news. please try after some time.")
    }
}
