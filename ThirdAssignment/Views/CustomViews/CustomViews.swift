//
//  CustomUIView.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 22/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

/// Class contain common UIView Designable and Insepectable.
@IBDesignable
class BaseView: UIView {
    
    @IBInspectable
    var cornerRadius:CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    ///Setting bottom border of size 0.5
    @IBInspectable
    var bottomBorder:Bool = false {
        didSet{
            if bottomBorder {
                addBottomBorderWithColor()
            }
        }
    }
    
}

// MARK: - Constant function for UIView
extension UIView {
    
    func boxShadow(){
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
    }
    
    func addBottomBorderWithColor() {
        let border = CALayer()
        border.backgroundColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5)
        self.layer.addSublayer(border)
    }
    
}

