//
//  LeftVcPresentedTransition.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

enum LeftVcTransitionType {
    case LeftVcTransitionTypePresenting
    case LeftVcTransitionTypeDismiss
}

class LeftVcPresentTransition: NSObject {
    
    let durationTime = 0.5
    
    var transitionType : LeftVcTransitionType
    
    init(transitionType: LeftVcTransitionType) {
        self.transitionType = transitionType
        super.init()
    }
}


extension LeftVcPresentTransition : UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return durationTime
    }
    
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch transitionType {
        case .LeftVcTransitionTypePresenting:
            presentingAnimation(transitionContext: transitionContext)
        case .LeftVcTransitionTypeDismiss:
            dismissAnimation(transitionContext: transitionContext)
        }
    }
    
    
    public func presentingAnimation(transitionContext:UIViewControllerContextTransitioning) {
        
        
        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view else {
                return
        }
//        guard let fromView = transitionContext.view(forKey: .from),
//            let toView = transitionContext.view(forKey: .to)
//            else {
//                return
//        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
//        containerView.addSubview(fromView)
        
        print(toView)
        
        
        let toViewWidth = containerView.frame.width, toViewHeight = containerView.frame.height
        
        toView.frame = CGRect(x: -toViewWidth, y: 0, width: toViewWidth, height: toViewHeight)
        
        UIView.animate(withDuration: durationTime, delay: 0, options: .curveEaseIn, animations: {
            toView.frame = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
            fromView.frame = CGRect(x: toViewWidth, y: 0, width: toViewWidth, height: toViewHeight)
        }, completion: {_ in
            
            print(toView)
            print(containerView)
//            UIApplication.shared.keyWindow?.sendSubview(toBack: toView)
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    
    public func dismissAnimation(transitionContext:UIViewControllerContextTransitioning) {

        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
//        containerView.addSubview(fromView)
        
        let toViewWidth = containerView.frame.width, toViewHeight = containerView.frame.height
        
        toView.frame = CGRect(x: toViewWidth, y: 0, width: toViewWidth, height: toViewHeight)
        
        
        UIView.animate(withDuration: durationTime, delay: 0, options: .curveEaseIn, animations: {
            toView.frame = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
            fromView.frame = CGRect(x: -toViewWidth, y: 0, width: toViewWidth, height: toViewHeight)
        }, completion: {_ in
            
            // Add the following line before completing the transition
//            UIApplication.shared.keyWindow?.sendSubview(toBack: toView)
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
    }
    
}
