//
//  ImageUtility.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 09/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit


/// Image Utility for image operationss
class ImageUtility {
    
    /// download image with url
    static func setImage(with url:URL , completion:@escaping (UIImage)->()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error =  error {
                print(error)
            } else{
                guard let imgData = data , let image = UIImage(data: imgData) else {return}
                DispatchQueue.main.sync {
                    completion(image)
                }
            }
        }
        task.resume()
    }
}
