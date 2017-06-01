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
    func setDismissInteractive()
}

class LeftViewController: UIViewController {

    public weak var delegate:LeftViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
}
