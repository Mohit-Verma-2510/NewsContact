//
//  NewsFeedViewToControllerProtocol.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// All Action for news feed - home view controller for news
protocol NewsFeedActions: AnyObject {
    
    /// when favourite buttoin is clicked in view
    func didFavouriteBtnClicked(_ senderIndex:Int)
    
    /// when table view cell is clicked
    func didSelectTableView(data:NewsViewModal)
}
