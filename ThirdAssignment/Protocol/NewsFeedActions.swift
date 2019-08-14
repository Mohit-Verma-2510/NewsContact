//
//  NewsFeedViewToControllerProtocol.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol NewsFeedActions {
    func didSelectTableView(data:NewsDataModal)
    func didFavouriteBtnClicked(_ senderIndex:Int)
    func didSelectTableViewNew(data:NewsObject)
}
