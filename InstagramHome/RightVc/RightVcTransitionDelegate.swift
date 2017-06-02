//
//  RightVcTransitionDelegate.swift
//  InsHome
//
//  Created by rain on 2017/6/1.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

class RightVcTransitionDelegate: NSObject {

}



extension RightVcTransitionDelegate : UINavigationControllerDelegate {
    

    public func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask()
    }
    
 
    public func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        return UIInterfaceOrientation(rawValue: 0)!
    }
    
    

    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
