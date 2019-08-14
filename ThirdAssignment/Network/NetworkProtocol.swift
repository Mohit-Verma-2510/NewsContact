//
//  NetworkProtocol.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 09/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// This is for network calls
protocol NetworkProtocol {
    
    /// Delegate
    var delegate:NewsDataProtocol? { get set }
    
    /// Common function to get all data
    func getAllData(with urlString: String)
    
}
