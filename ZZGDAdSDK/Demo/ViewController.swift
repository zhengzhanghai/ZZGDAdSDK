//
//  ViewController.swift
//  Demo
//
//  Created by zhengzhanghai on 2023/7/24.
//

import UIKit
import ZZGDAdSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ADManager.shared.start("5407783")
    }


}

