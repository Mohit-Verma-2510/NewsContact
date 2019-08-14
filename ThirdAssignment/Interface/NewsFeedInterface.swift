//
//  NewsFeedViewModal.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

/// Protocol for sending news data
protocol NewsDataProtocol: AnyObject {
    func sendData(data: [NewsObject])
}

/// All Api call for news
class NewsFeedInterface: NetworkProtocol{
    
    /// Singleton
    static let shared = NewsFeedInterface()
    private init(){}
    
    /// Delegate for data
    weak var delegate: NewsDataProtocol?
    
    /// Getting all news data.
    func getAllData(with urlString: String) {
        let urlStr = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=6a0aa94c1e194d1e908ccd08bec615b3"
        NetworkDataManager.shared.callNewsApi(with: urlStr) { (result, error) in
            guard error == nil else { return }
            guard let article = result?["articles"] as? [NSDictionary] else { return }
            
            var dataTosend = [NewsObject]()
            for result in article {
                dataTosend.append(NewsObject(data: result))
            }
            self.delegate?.sendData(data: dataTosend)
        }
    }
    
}
