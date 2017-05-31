//
//  LeftVcPresentedTransition.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

enum LeftVcTransitionType {
    case LeftVcTransitionTypePresented
    case LeftVcTransitionTypeDismiss
}

class LeftVcPresentTransition: NSObject {

    var transitionType : LeftVcTransitionType
    
    init(transitionType: LeftVcTransitionType) {
        self.transitionType = transitionType
        super.init()
        self.setupViews()
    }
    
    
    
    private func setupViews() {
        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        btn.addTarget(self, action:#selector(dismiss), for: .touchUpInside)
        
    }
    
    @objc func dismiss() {
        dismiss()
    }
}


extension LeftVcPresentTransition : UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch transitionType {
        case .LeftVcTransitionTypePresented:
            break
        case .LeftVcTransitionTypeDismiss:
            break
        default:
            break
        }
        
    }
}
