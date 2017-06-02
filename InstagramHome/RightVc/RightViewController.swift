//
//  RightViewController.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    // private 是真正意义上的私有, 不能传到外面让其它类修改
    
//    private var transitionDelegate:RightVcTransitionDelegate?
    public var transitionDelegate:LeftVcTransitionDelegate?
    
    public var interfaceTransition: SwipeUpInteractiveTransition = SwipeUpInteractiveTransition(interactiveType: .InteractiveTypeRight)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    print("left vc did loaded")
        view.backgroundColor = UIColor.init(white: 0.7, alpha: 1.0)
        
        interfaceTransition.wireToViewController(viewController: self)
        interfaceTransition.operation = ({
            [weak self]in
            self?.navigationController?.popViewController(animated: true)
        })
    }

    init(transitionDelegate:LeftVcTransitionDelegate) {
        self.transitionDelegate = transitionDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    deinit {
        print("right vc deinit")
    }

}




extension RightViewController : UINavigationControllerDelegate {


    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RightVcPushTransition(transitionType: operation == .push ? .RightVcTransitionTypePush : .RightVcTransitionTypePop)
    }
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interfaceTransition.interacting ? interfaceTransition : nil
    }
    
}
