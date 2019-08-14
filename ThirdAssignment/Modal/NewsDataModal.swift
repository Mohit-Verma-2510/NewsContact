//
//  NewsDataModal.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

class NewsDataModal {
    
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    var isFav:Bool
    
    lazy var fullNews: String = {
        [unowned self] in
        return self.title + "\n\n" + self.description
        }()
    
    init(data:NSDictionary) {
        self.title = data["title"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.url = data["url"] as? String ?? ""
        self.urlToImage = data["urlToImage"] as? String ?? ""
        self.isFav = data["isFav"] as? Bool ?? false
    }
    
}

