//
//  RightVcPushTransition.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

enum RightVcTransitionType {
    case RightVcTransitionTypePush
    case RightVcTransitionTypePop
}

class RightVcPushTransition: NSObject {
    
    let durationTime = 0.75
    
    var transitionType : RightVcTransitionType
    
    init(transitionType: RightVcTransitionType) {
        self.transitionType = transitionType
        super.init()
    }
}


extension RightVcPushTransition : UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return durationTime
    }
    
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch transitionType {
        case .RightVcTransitionTypePush:
            pushAnimation(transitionContext: transitionContext)
        case .RightVcTransitionTypePop:
            popAnimation(transitionContext: transitionContext)
        }
        
    }
    
    public func popAnimation(transitionContext:UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        //        containerView.addSubview(fromView)
        
        print(toView)
        
        
        let toViewWidth = containerView.frame.width, toViewHeight = containerView.frame.height
        
        toView.frame = CGRect(x: -toViewWidth, y: 0, width: toViewWidth, height: toViewHeight)
        
        UIView.animate(withDuration: durationTime, delay: 0, options: .curveEaseInOut, animations: {
            toView.frame = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
            fromView.frame = CGRect(x: toViewWidth, y: 0, width: toViewWidth, height: toViewHeight)
        }, completion: {_ in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    
    public func pushAnimation(transitionContext:UIViewControllerContextTransitioning) {
        
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
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}


