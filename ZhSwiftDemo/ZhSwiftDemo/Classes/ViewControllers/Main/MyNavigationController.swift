//
//  MyNavigationController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/2.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: KImageName("nav_back_black"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func navigationBack() {
        popViewController(animated: true)
    }

}
