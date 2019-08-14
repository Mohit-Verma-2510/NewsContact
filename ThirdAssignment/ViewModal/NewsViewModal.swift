//
//  NewsViewModal.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 09/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol NewsViewModal: AnyObject {
    
    /// Title for news
    var newsTitle: String { get }
    
    /// some information about news
    var newsDescription: String { get }
    
    /// URL for Complete information about news
    var newsURL: String { get }
    
    /// Image URL
    var newsUrlToImage: String { get }
    
    /// Custom setting favourite news
    var newsIsFav: Bool { get }
    
    /// news content
    var newsContent: String { get }
    
}
extension NewsObject: NewsViewModal {
    
    /// Setting value for title
    var newsTitle: String {
        return title
    }
    
    /// Setting value for description
    var newsDescription: String {
        return desc
    }
    
    /// Setting value for url
    var newsURL: String {
        return url
    }
    
    /// Setting value for image url
    var newsUrlToImage: String {
        return urlToImage
    }
    
    /// Setting value for news favourite
    var newsIsFav: Bool {
        return isFav
    }
    
    /// news content
    var newsContent: String {
        return content
    }
    
}
