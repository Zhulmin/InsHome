//
//  LeftViewController.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit


public protocol LeftViewControllerDelegate:NSObjectProtocol {
    func dismiss()
}

class LeftViewController: UIViewController {

    public weak var delegate:LeftViewControllerDelegate?
    
    private let transitionDelegate : LeftVcTransitionDelegate?
    
    init(transitionDelegate:LeftVcTransitionDelegate) {
        self.transitionDelegate = transitionDelegate
        super.init(nibName: nil, bundle: nil)
        
        transitioningDelegate = transitionDelegate
        
        transitionDelegate.dismissInterface.wireToViewController(viewController: self)
        transitionDelegate.dismissInterface.operation = ({
            [weak self] in
            self?.dismissVc()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("left vc did loaded")
        view.backgroundColor = UIColor.init(white: 0.8, alpha: 1.0)
        self.setupViews()
    }
    
    private func setupViews() {
        let btn = UIButton()
        btn.backgroundColor = UIColor.purple
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        view.addSubview(btn)
        btn.addTarget(self, action:#selector(dismissVc), for: .touchUpInside)
    }
    
    func dismissVc() {
        delegate?.dismiss()
    }
    
    
    deinit {
        print("left vc deinit")
    }
}
