//
//  File.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 29/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// This is for favouite action
protocol NewsFeedTVProtocol {
    /// when favourite button is clicked
    /// getting action from table view cell to controllers view
    func favButtonAction(_ senderIndex: Int)
}
