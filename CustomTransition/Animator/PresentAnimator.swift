//
//  PresentAnimator.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/20/20.
//

import UIKit

class  PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: TimeInterval = 1.0
    var presenting = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
