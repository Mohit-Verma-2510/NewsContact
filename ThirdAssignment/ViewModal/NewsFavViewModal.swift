//
//  NewsFavViewModal.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 14/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol NewsFavViewModal {
    
    /// Title for news
    var newsFavTitle: String { get }
    
    /// some information about news
    var newsFavDescription: String { get }
    
}
extension NewsObject: NewsFavViewModal {
    
    /// Setting value for title
    var newsFavTitle: String {
        return title
    }
    
    /// Setting value for description
    var newsFavDescription: String {
        return desc
    }
}
