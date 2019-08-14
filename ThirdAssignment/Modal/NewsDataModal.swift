//
//  NewsDataModal.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

typealias newsSource = [String: Any]

/// Complete news information
class NewsDataModal {
    
    /// Title for news
    let title: String
    
    /// some information about news
    let description: String
    
    /// URL for Complete information about news
    let url: String
    
    /// Image URL
    let urlToImage: String
    
    /// Custom setting favourite news
    var isFav:Bool
    
    /// Author for news
    let author: String
    
    /// news publish date
    let publishedAt: String
    
    /// Content for news
    let content: String
    
    /// news source
    let source: newsSource
    
    /// initialization of full data
    init(data:NSDictionary) {
        self.title = data["title"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.url = data["url"] as? String ?? ""
        self.urlToImage = data["urlToImage"] as? String ?? ""
        self.isFav = data["isFav"] as? Bool ?? false
        self.author = data["author"] as? String ?? ""
        self.publishedAt = data["publishedAt"] as? String ?? ""
        self.content = data["content"] as? String ?? ""
        self.source = data["source"] as? newsSource ?? [:]
        
    }
    
}

