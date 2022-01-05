//
//  CustomTransition.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/20/20.
//

import UIKit

class CustomTransition: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return PresentAnimator()
     }
     
     func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return nil
     }
}
