//
//  BaseViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/7/31.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

enum NavigationBar {
    case NAV_LEFT
    case NAV_RIGHT
}

class BaseViewController: UIViewController {
    
//    var viewModel: BaseViewModel{
//        return BaseViewModel()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //消除导航栏分割线
        navigationController?.navigationBar.setBackgroundImage(UIImage().imageFromColor(color: UIColor.clear), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        setupSubViews()
//        bindViewModel()
    }

    // MARK:- UI
    public func setupSubViews() -> Void {
    }
    
    // MARK:- 绑定viewModel
//    func bindViewModel() -> Void {
//    }
}

extension BaseViewController{
    
    // MARK:- 设置导航栏文字按钮
    func showBarButtonWithTitle(position: NavigationBar, title: String, color: UIColor) -> Void {
        let button: UIButton = UIButton().initNavigationButtonWithTitle(title: title, color: color)
        showBarButtonWithCustomButton(position: position, button: button)
    }
    
    // MARK:- 设置导航栏图片按钮
    func showBarButtonWithImageName(position: NavigationBar, imageName: String) -> Void {
        let button: UIButton = UIButton().initNavigationButton(image: KImageName(imageName))
        showBarButtonWithCustomButton(position: position, button: button)
    }
    // MARK:- 设置导航栏左右按钮
    func showBarButtonWithCustomButton(position: NavigationBar, button: UIButton) -> Void {
        switch position {
        case .NAV_LEFT:
            button.addTarget(self, action: #selector(leftButtonTouch), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
            break
        default:
            button.addTarget(self, action: #selector(rightButtonTouch), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: button)
            break
        }
    }
    
    @objc func leftButtonTouch() {
        
    }
    
    @objc func rightButtonTouch(){
        
    }
    
}

extension BaseViewController {
    func setUpNaviView() {
        showBarButtonWithImageName(position: NavigationBar.NAV_LEFT, imageName: "dy_ic_navi_user")
        showBarButtonWithImageName(position: NavigationBar.NAV_RIGHT, imageName: "dy_ic_navi_history")
        
        let searchView = NaviSearchView()
        searchView.backgroundColor = KHexColor("EA8450")
        searchView.layer.cornerRadius = 5
        navigationItem.titleView = searchView
        searchView.snp.makeConstraints { (make) in
            make.center.equalTo((navigationItem.titleView?.snp.center)!)
            make.width.equalTo(KAutoLayoutWidth(230))
            make.height.equalTo(33)
        }
    }
}
