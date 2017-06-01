//
//  LeftVcTransitionDelegate.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit


class LeftVcTransitionDelegate: NSObject,UIViewControllerTransitioningDelegate {

    public var presentingInterface : SwipeUpInteractiveTransition = SwipeUpInteractiveTransition(interactiveType: .InteractiveTypeRight)
    public var dismissInterface : SwipeUpInteractiveTransition = SwipeUpInteractiveTransition(interactiveType: .InteractiveTypeLeft)
    
    // 代理方法
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LeftVcPresentTransition(transitionType: .LeftVcTransitionTypePresenting)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LeftVcPresentTransition(transitionType: .LeftVcTransitionTypeDismiss)
    }
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return presentingInterface.interacting ? presentingInterface : nil;
    }
    
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return dismissInterface.interacting ? dismissInterface : nil;
    }
}
