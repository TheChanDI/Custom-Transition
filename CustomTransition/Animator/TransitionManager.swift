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
    let duration: TimeInterval!
    
    var operation = UINavigationController.Operation.push
    
    //MARK: - Initializer
    init(duration: TimeInterval) {
        self.duration = duration
    }
    

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
    
    // For presenting view controller.
    func presentAnimation(from fromVC: UIViewController, to toVC: UIViewController, with context: UIViewControllerContextTransitioning) {

        guard
            let firstVC = fromVC as? FirstVC,
            let secondVC = toVC as? SecondVC

        else { return }

        let itemView = firstVC.customItem
        secondVC.view.layoutIfNeeded()
        let containerView = context.containerView
        
        let grayView = UIView()
        grayView.backgroundColor = itemView.backgroundColor
        grayView.frame = containerView.convert(itemView.frame, from: firstVC.view)
        grayView.layer.cornerRadius = firstVC.customItem.layer.cornerRadius
        
        let shoeImage = UIImageView()
        shoeImage.image = itemView.image.image
        shoeImage.frame = containerView.convert(itemView.image.frame, from: itemView)

        
        let nameLabel = UILabel()
        nameLabel.text = itemView.nameLabel.text
        nameLabel.frame = containerView.convert(itemView.nameLabel.frame, from: itemView)
        nameLabel.textColor = itemView.nameLabel.textColor
        nameLabel.font = itemView.nameLabel.font
        
        let priceLabel = UILabel()
        priceLabel.text = itemView.priceLabel.text
        priceLabel.frame = containerView.convert(itemView.priceLabel.frame, from: itemView)
        priceLabel.font = itemView.priceLabel.font
        priceLabel.textColor = itemView.priceLabel.textColor
        print(priceLabel.frame, "before --->")
//
//        snapshotContentView.backgroundColor = firstVC.button.backgroundColor
//        //Taking the frame of button from ViewController' view and assigning in the containerview
//        snapshotContentView.frame = containerView.convert(firstVC.button.frame, from: firstVC.view)
//
        containerView.addSubview(secondVC.view)
        containerView.addSubview(grayView)
        containerView.addSubview(shoeImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
        firstVC.customItem.isHidden = true
        //SecondVC view is hidden because we dont want to show it during animation.
        secondVC.view.isHidden = true
//
//
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut) {
            grayView.frame = containerView.convert(secondVC.grayView.frame, from: secondVC.view)
            grayView.backgroundColor = #colorLiteral(red: 0.1970187409, green: 0.5609255198, blue: 0.8630290212, alpha: 0.27)
            grayView.layer.cornerRadius = 0
            
            shoeImage.frame = containerView.convert(secondVC.image.frame, from: secondVC.view)
     
            
            nameLabel.frame = containerView.convert(secondVC.nameLabel.frame, from: secondVC.view)
            nameLabel.font = secondVC.nameLabel.font
            nameLabel.textColor = secondVC.nameLabel.textColor
            
            priceLabel.frame = containerView.convert(secondVC.priceLabel.frame, from: secondVC.view)
            priceLabel.textColor = secondVC.priceLabel.textColor
            priceLabel.font = secondVC.priceLabel.font
            
            print(priceLabel.frame, "after --->")
            
        } completion: { _ in
            secondVC.view.isHidden = false
            firstVC.customItem.isHidden = false
            nameLabel.removeFromSuperview()
            shoeImage.removeFromSuperview()
            grayView.removeFromSuperview()
            priceLabel.removeFromSuperview()
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

//        let containerView = context.containerView
//
//        let snapshotContentView = UIView()
//        snapshotContentView.backgroundColor = firstVC.yellowView.backgroundColor
//        snapshotContentView.frame = containerView.convert(firstVC.yellowView.frame, from: firstVC.view)
//
//        containerView.addSubview(secondVC.view)
//        containerView.addSubview(snapshotContentView)
//        firstVC.yellowView.isHidden = true
//        firstVC.titleLabel.isHidden = true
//        secondVC.view.isHidden = true
//
//        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn) {
//            snapshotContentView.frame = containerView.convert(secondVC.button.frame, from: secondVC.view)
//        } completion: { _ in
//            secondVC.view.isHidden = false
//            snapshotContentView.removeFromSuperview()
//            context.completeTransition(true)
//        }
        context.completeTransition(false)

    }

}

//MARK: - UINAVIGATION CONTROLLER DELEGATE
extension TransitionManager: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            
            self.operation = operation
            if operation == .push {
                return self
            }
            else {
                return nil
            }
      
            
        }
}
