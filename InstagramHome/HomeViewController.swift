//
//  HomeViewController.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    let transitionDelegate = LeftVcTransitionDelegate()
    let leftVc = LeftViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionDelegate.presentingInterface.wireToViewController(viewController: self)
        leftVc.transitioningDelegate = transitionDelegate
        transitionDelegate.presentingInterface.operation = ({
            [weak self] in
            self?.present((self?.leftVc)!, animated: true, completion: nil)
        })
        
        transitionDelegate.dismissInterface.wireToViewController(viewController: leftVc)
        transitionDelegate.dismissInterface.operation = ({
            [weak self] in
            self?.dismiss(animated: true, completion: nil)
        })
    }
    
    @IBAction public func leftBtnOnClick() {
        
        leftVc.delegate = self
        present(leftVc, animated: true, completion: nil)
    }
    
    @IBAction func rightBtnOnClick() {
        
    }
}


extension HomeViewController : LeftViewControllerDelegate {
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setDismissInteractive () {
    
    }
}

