//
//  CustomImageView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Class contain common UIImageView Designable and Insepectable.
@IBDesignable
class CustomImageView: UIImageView {
    
    /// For corner radius
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
