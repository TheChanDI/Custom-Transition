//
//  TransitionManager.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/22/21.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    //MARK: Propreties
    /// Duration for the whole transition.
    let duration: TimeInterval = 0.5
    
    var operation = UINavigationController.Operation.push
    

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to)
        else {
            transitionContext.completeTransition(false)
            return
        }
    
        switch operation {
    
        case .push:
            presentAnimation(from: fromViewController, to: toViewController, with: transitionContext)
            
        case .pop:
            dismissAnimation(from: fromViewController, to: toViewController, with: transitionContext)
            
        default:
            break
        }
        
    }
    
    /// For presenting view controller.
    func presentAnimation(from fromVC: UIViewController, to toVC: UIViewController, with context: UIViewControllerContextTransitioning) {
        
        guard
            let firstVC = fromVC as? FirstVC,
            let secondVC = toVC as? SecondVC
                
        else { return }
        
        let containerView = context.containerView
        
        
        let snapshotContentView = UIView()
        snapshotContentView.backgroundColor = firstVC.button.backgroundColor
        //Taking the frame of button from ViewController' view and assigning in the containerview
        snapshotContentView.frame = containerView.convert(firstVC.button.frame, from: firstVC.view)
        
        containerView.addSubview(secondVC.view)
        containerView.addSubview(snapshotContentView)
        firstVC.button.isHidden = true
        //SecondVC view is hidden because we dont want to show it during animation.
        secondVC.view.isHidden = true
        
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn) {
            snapshotContentView.frame = containerView.convert(secondVC.yellowView.frame, from: secondVC.view)
        } completion: { _ in
            secondVC.view.isHidden = false
            firstVC.button.isHidden = false
            snapshotContentView.removeFromSuperview()
            context.completeTransition(true)
        }
    }
    
    /// For dismissing view controller.
    //This function is similar to presentAnimation. Only defference are the fromViewController is now
    // SecondVC and toViewController is FirstVC
    func dismissAnimation(from fromVC: UIViewController, to toVC: UIViewController, with context: UIViewControllerContextTransitioning) {
        guard
            let firstVC =  fromVC as? SecondVC,
            let secondVC = toVC as? FirstVC
                
        else { return }
        
        let containerView = context.containerView
        
        let snapshotContentView = UIView()
        snapshotContentView.backgroundColor = firstVC.yellowView.backgroundColor
        snapshotContentView.frame = containerView.convert(firstVC.yellowView.frame, from: firstVC.view)
        
        containerView.addSubview(secondVC.view)
        containerView.addSubview(snapshotContentView)
        firstVC.yellowView.isHidden = true
        firstVC.titleLabel.isHidden = true
        secondVC.view.isHidden = true
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn) {
            snapshotContentView.frame = containerView.convert(secondVC.button.frame, from: secondVC.view)
        } completion: { _ in
            secondVC.view.isHidden = false
            snapshotContentView.removeFromSuperview()
            context.completeTransition(true)
        }
        
    }
    
}

//MARK: - UINAVIGATION CONTROLLER DELEGATE
extension TransitionManager: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            
            self.operation = operation
            return self
            
        }
}
