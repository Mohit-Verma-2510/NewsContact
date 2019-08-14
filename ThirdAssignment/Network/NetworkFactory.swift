//
//  NetworkFactory.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 09/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Factory class for network operation
class NetworkFactory {
    
    /// Enum for all network classses
    enum ClassType {
        case newsFeed
    }
    
    /// creating Object for class
    func create(with classType: ClassType) -> NetworkProtocol {
        switch classType {
        case .newsFeed:
            return NewsFeedInterface.shared
        }
    }
    
}
