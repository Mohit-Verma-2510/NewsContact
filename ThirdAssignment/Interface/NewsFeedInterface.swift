//
//  NewsFeedViewModal.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

protocol NewsDataProtocol {
    func sendData(data: [NewsDataModal])
}

class NewsFeedInterface {
    
    static let shared = NewsFeedInterface()
    
    var delegate: NewsDataProtocol?
    
    private init(){}
    
    func getAllNewsData()  {
        NewsApi.shared.callNewsApi { (result, error) in
            guard error == nil else { return }
            
            guard let article = result?["articles"] as? [NSDictionary] else { return }
            
            var dataTosend = [NewsDataModal]()
            for result in article {
                dataTosend.append(NewsDataModal(data: result))
            }
            
            self.delegate?.sendData(data: dataTosend)
        }
        
    }
    
}
