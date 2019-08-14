//
//  File.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 23/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation

class NetworkDataManager {
    static let shared = NetworkDataManager()
    private init() {}
    
    /// Getting Data For API'S
    func callNewsApi(with url: String, completed: @escaping(NSDictionary?,NSError?)->()){
        DispatchQueue.global().async {
            guard let currentURL = URL(string: url) else {
                completed(nil,nil)
                return
            }
            let task = URLSession.shared.dataTask(with: currentURL) { (data, response, error) in
                guard error == nil else {
                    print("The error is :: \(error!)")
                    completed(nil,error as NSError?)
                    return
                }
                
                guard let unWrappedData = data, unWrappedData.count > 0 else { return }
                do {
                    guard let result = try JSONSerialization.jsonObject(with: unWrappedData, options: .mutableContainers) as? NSDictionary else {
                        print("error in parsing json...")
                        completed(nil, NSError(domain: "error in parsing json response", code: 1, userInfo: nil))
                        return
                    }
                    completed(result,nil)
                }
                catch let err as NSError {
                    completed(nil,err)
                }
            }
            task.resume()
        }
    }
}
