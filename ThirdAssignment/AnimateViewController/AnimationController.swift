//
//  AnimationController.swift
//  VCPresent
//
//  Created by Mohit Verma on 11/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit


class CircularAnimationController : NSObject {
    
    private let animationDuration: Double
    private let animationType: AnimationType
    
    private var circle = UIView()
    private var startingPoint : CGPoint
    
    private let transColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1)
    
    enum AnimationType {
        case present, dismiss, pop
    }
    
    init(animationDuration:Double,animationType:AnimationType, startingPoint:CGPoint) {
        self.animationDuration = animationDuration
        self.animationType = animationType
        self.startingPoint = startingPoint
    }
    
    
}

//MARK:-
extension CircularAnimationController : UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to) ,
            let fromViewController = transitionContext.viewController(forKey: .from)
            else {
                transitionContext.completeTransition(false)
                return
        }
        
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
        case .pop:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
        }
        
        
    }
    
    ///Present View Contoller Animation
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning , viewToAnimate: UIView) {
        
        let viewCenter = viewToAnimate.center
        let viewSize = viewToAnimate.frame.size
        let duration = transitionDuration(using: transitionContext)
        
        circle = UIView()
        circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
        circle.layer.cornerRadius = circle.frame.size.height / 2
        circle.center = startingPoint
        circle.backgroundColor = transColor
        circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        transitionContext.containerView.addSubview(circle)
        
        viewToAnimate.center = startingPoint
        viewToAnimate.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        viewToAnimate.alpha = 0
        transitionContext.containerView.addSubview(viewToAnimate)
        
        UIView.animate(withDuration: duration, animations: {
            
            self.circle.transform = CGAffineTransform.identity
            viewToAnimate.transform = CGAffineTransform.identity
            viewToAnimate.alpha = 1
            viewToAnimate.center = viewCenter
            
        }) { (isSuccess:Bool) in
            transitionContext.completeTransition(isSuccess)
        }
        
    }
    
    ///Dismiss View Controller Animation
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning , viewToAnimate: UIView) {
        
        let duration = transitionDuration(using: transitionContext)
        let viewCenter = viewToAnimate.center
        let viewSize = viewToAnimate.frame.size
        let containerView = transitionContext.containerView
        
        circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
        circle.layer.cornerRadius = circle.frame.size.height / 2
        circle.center = startingPoint
        circle.backgroundColor = transColor
        
        UIView.animate(withDuration: duration, animations: {
            self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            viewToAnimate.center = self.startingPoint
            viewToAnimate.alpha = 0
            
            if self.animationType != .pop {
                containerView.insertSubview(viewToAnimate, belowSubview: viewToAnimate)
                containerView.insertSubview(self.circle, belowSubview: viewToAnimate)
            }
            
        }) { (isSuccess:Bool) in            
            viewToAnimate.center = viewCenter
            viewToAnimate.removeFromSuperview()
            self.circle.removeFromSuperview()
            transitionContext.completeTransition(isSuccess)
        }
        
    }
    
    func frameForCircle (withViewCenter viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect {
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offestVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offestVector, height: offestVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    
    
}
