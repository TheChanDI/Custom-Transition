//
//  DismissAnimator.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/20/20.
//

import UIKit
 
class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration:TimeInterval = 0.5
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
     
        guard let start = transitionContext.view(forKey: .from) else {
            return
        }
                
        guard let finish = transitionContext.view(forKey: .to) else {
            return
        }
        
        let btn = start.subviews[0] as! UIButton
        
        print(btn)
        
        // Setup the "start" view
        let frame = UIScreen.main.bounds
        start.frame = frame
        start.layer.cornerRadius = 30
        start.layer.shadowColor = UIColor.black.cgColor
        start.layer.shadowRadius = 12
        start.layer.shadowOpacity = 0.15
        start.transform = .identity
        
        // Setup the "finish" view
        finish.layer.cornerRadius = 30
        finish.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        finish.alpha = 0.5
        transitionContext.containerView.addSubview(finish)
        transitionContext.containerView.sendSubviewToBack(finish)
                        
        // Animate
        UIView.animateKeyframes(withDuration: self.duration, delay: 0, options: [.calculationModeCubic]) {
                                    
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 1.0) {
                finish.transform = .identity
                finish.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
                start.frame.origin.y = frame.width * 2
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                start.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
            }
            
            btn.transform = .identity
            
        } completion: { (success) in
            transitionContext.completeTransition(success)
        }
    }
}
