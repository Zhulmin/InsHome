//
//  SwipeUpInteractiveTransition.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

enum TransitionType {
    case TransitionTypePush
    case TransitionTypePop
    case TransitionTypePresent
    case TransitionTypeDismiss
}

enum InteractiveType {
    case InteractiveTypeLeft
    case InteractiveTypeRight
    case InteractiveTypeUp
    case InteractiveTypeDown
}

class SwipeUpInteractiveTransition: UIPercentDrivenInteractiveTransition {

    private var interactiveType: InteractiveType
    
    // 闭包
    public var operation : (()->())?
    public var interacting: Bool = false
    
    init(interactiveType:InteractiveType) {
        self.interactiveType = interactiveType
        super.init()
    }
    
    private var shouldComplete: Bool = false
    private weak var presentingVC: UIViewController?
    
    public func wireToViewController(viewController :UIViewController) {
        self.presentingVC = viewController
        prepareGestureRecognizerInView(view: viewController.view)
    }
    
    private func prepareGestureRecognizerInView(view:UIView) {
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(handleGesture(gestureRecognizer:)))
        
        view.addGestureRecognizer(gesture)
    }
    

    func handleGesture(gestureRecognizer:UIPanGestureRecognizer) {
        
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
        
        var translationValue = CGFloat(0.0)
        
        switch interactiveType {
        case .InteractiveTypeLeft, .InteractiveTypeUp:
            translationValue = -translation.x
        case .InteractiveTypeRight, .InteractiveTypeDown:
            translationValue = translation.x
        }
        
        switch gestureRecognizer.state {
        case .began:
            interacting = true
            if operation != nil {
                operation!()
            }
        case .changed:
            var fraction = translationValue / 280.0;
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            print(fraction)
            shouldComplete = fraction > 0.5
            update(fraction)
        case .ended:
            fallthrough
        case .cancelled:
            interacting = false
            if !shouldComplete ||  gestureRecognizer.state == UIGestureRecognizerState.cancelled {
                cancel()
            }else {
                finish()
            }
        default:
            break
        }
    }
    
}
