//
//  ViewController.swift
//  InstagramHome
//
//  Created by rain on 2017/5/31.
//  Copyright © 2017年 rain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func leftBtnOnClick() {
        let leftVc = LeftViewController()
        present(leftVc, animated: true, completion: nil)
        
    }
    
    @IBAction func rightBtnOnClick() {
        
    }
    
}

