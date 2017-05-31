//
//  LeftViewController.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
    }

}


extension LeftViewController : UIViewControllerTransitioningDelegate {
    
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LeftVcPresentTransition(transitionType: .LeftVcTransitionTypePresented)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LeftVcPresentTransition(transitionType: .LeftVcTransitionTypeDismiss)
    }
    
    
    /** 动画 返回percent手势对象 */
    
//    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        
//    }
//    
//    
//    
//    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        
//    }
    
    
}
