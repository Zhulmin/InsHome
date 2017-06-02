//
//  HomeViewController.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.


import UIKit


class HomeViewController: UIViewController {
    
    let transitionDelegate = LeftVcTransitionDelegate()
    let pushTransitionDelegate = RightVcTransitionDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // add pan gesture
        transitionDelegate.presentingInterface.wireToViewController(viewController: self)
        
        // present left vc.
        transitionDelegate.presentingInterface.operation = ({
            [weak self] in
            self?.leftBtnOnClick()
        })
        
        // push right vc.
        transitionDelegate.presentingInterface.secondOperation = ({
            [weak self] in
            self?.rightBtnOnClick()
        })
    }
    
    @IBAction public func leftBtnOnClick() {
        
        let leftVc = LeftViewController(transitionDelegate:transitionDelegate)
        leftVc.delegate = self
        present(leftVc, animated: true, completion: nil)
    }
    
    @IBAction func rightBtnOnClick() {
        let rightVc = RightViewController(transitionDelegate: transitionDelegate)
        navigationController?.delegate = rightVc;
        navigationController?.pushViewController(rightVc, animated: true)
    }
}


extension HomeViewController : LeftViewControllerDelegate {
    // 喵神说, 被展示的控制器 dismiss应该在上个控制器做dismiss操作 (当上个控制器展示在下一层, 而非被隐藏的时候)
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}

