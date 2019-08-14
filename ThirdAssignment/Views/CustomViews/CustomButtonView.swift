//
//  CustomButton.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 26/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Class contain common UIButton Designable and Insepectable.
@IBDesignable
class CustomButtonView: UIButton {
    
    @IBInspectable
    var cornerRadius:CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
}
