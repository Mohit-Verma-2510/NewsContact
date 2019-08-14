//
//  CustomLabelView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 23/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Class contain common UILabel Designable and Insepectable.
@IBDesignable
class CustomLabelView: UILabel {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}

// MARK: - Constant function
extension CustomLabelView{
    func addShadow(){
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
    }
}
