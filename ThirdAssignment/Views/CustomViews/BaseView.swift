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
    
    /// To enable Custom properties
    var isViewConfigurable = false
    
    /// Activity Indicator
    var activityIndicator = UIActivityIndicatorView()
    
    /// Setting corner radius from storyboard
    @IBInspectable
    var cornerRadius:CGFloat = 0.0 {
        didSet {
            if isViewConfigurable{
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    ///Setting bottom border from storyboard
    @IBInspectable
    var bottomBorder:Bool = false {
        didSet{
            if bottomBorder , isViewConfigurable{
                addBottomBorderWithColor()
            }
        }
    }
    
}

// MARK: - Constant function for UIView
extension BaseView {
    ///REMOVED
}

//MARK:- Common for all Views
extension UIView {
    /// Adding Shadow all sides
    func boxShadow(){
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
    }
    
    /// Adding border at bottom
    func addBottomBorderWithColor() {
        let border = CALayer()
        border.backgroundColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5)
        self.layer.addSublayer(border)
    }
}

//MARK:- Activity Indicator
extension BaseView {
    /// Activity Indicator Start Animation
    public func startActivityIndicator(){
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    /// Activity Indicator Stop Animation
    public func stopActivityIndicator(){
        activityIndicator.stopAnimating()
    }
}

