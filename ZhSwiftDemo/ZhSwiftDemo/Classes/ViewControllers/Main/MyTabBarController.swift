//
//  MyTabBarController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/1.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        setChildViewController(DYHomeViewController(), "推荐", "dy_tab_recommend")
        setChildViewController(DYEnterTainmentViewController(), "娱乐", "dy_tab_entertainment")
        setChildViewController(DYFocusViewController(), "关注", "dy_tab_focus")
        setChildViewController(DYFishBarViewController(), "鱼吧", "dy_tab_fishbar")
        setChildViewController(DYDiscoveryViewController(), "发现", "dy_tab_discovery")
//        setChildViewController(HomeViewController(), "首页", "tab_home")
//        setChildViewController(VideoViewController(), "西瓜视频", "tab_video")
//        setChildViewController(RedPackageViewController(), "", "tab_redpackage")
//        setChildViewController(WeitoutiaoViewController(), "微头条", "tab_weitoutiao")
//        setChildViewController(HuoshanViewController(), "推荐", "tab_huoshan")
    }
    
    private func setChildViewController(_ childController: UIViewController,_ title: String,_ imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName + "_normal")?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_checked")?.withRenderingMode(.alwaysOriginal)
        childController.title = title
        //添加nav
        addChildViewController(MyNavigationController(rootViewController: childController))
    }

}
