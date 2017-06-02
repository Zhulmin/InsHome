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

    /** 设置滑动距离 */
    static let swipeDistance = CGFloat(150.0)
    private var currentValue = CGFloat(0.0)
    private var interactiveType: InteractiveType
    
    public var operation : (()->())?
    public var secondOperation : (()->())?
    public var interacting: Bool = false
    
    init(interactiveType:InteractiveType) {
        self.interactiveType = interactiveType
        super.init()
    }
    
    private var shouldComplete: Bool = false
    private var isChanged: Bool = false
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
        case .InteractiveTypeLeft:
            translationValue = -translation.x
        case .InteractiveTypeUp:
            translationValue = translation.y
        case .InteractiveTypeRight:
            translationValue = translation.x
        case .InteractiveTypeDown:
            translationValue = -translation.y
        }
        
//        print(translationValue)
        
        switch gestureRecognizer.state {
        case .began:
            
            interacting = true
        case .changed:
            
            if !isChanged {
                
                currentValue = translationValue
                if translationValue > 0 {
                    if operation != nil {
                        operation!()
                    }
                }else {
                    
                    if secondOperation != nil {
                        secondOperation!()
                    }
                }
            }
            
            isChanged = true
            
            // 如果方向改变了, 则重新计算
            if (currentValue > CGFloat(0.0) && translationValue < CGFloat(0.0)) || (currentValue < CGFloat(0.0) && translationValue > CGFloat(0.0)) {
                cancel()
                currentValue = translationValue
                isChanged = false
                break
            }
            
            if translationValue < 0 {
                translationValue = -translationValue
            }
            
            var fraction = translationValue / SwipeUpInteractiveTransition.swipeDistance;
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))

            shouldComplete = fraction > 0.35
            
            if fraction > 0.37 {
                //平缓动画
                finish()
                break
            }
            print(fraction)
            update(fraction)
            
        case .ended:
            fallthrough
        case .cancelled:
            interacting = false
            isChanged = false
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
