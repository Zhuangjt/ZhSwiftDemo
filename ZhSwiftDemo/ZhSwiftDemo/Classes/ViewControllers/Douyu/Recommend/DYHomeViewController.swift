//
//  DYHomeViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/12.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class DYHomeViewController: BaseViewController {

    //标题数组
    private lazy var titles : [String] = ["分类","推荐","全部","LOL","绝地求生","王者荣耀","QQ飞车"]
    //控制器数组
    private lazy var controllers :[BaseViewController] = [DYClassifyViewController(),DYRecommendViewController(),DYAllViewController(),DYLOLViewController(),DYJDQSViewController(),DYWZRYViewController(),DYQQCarViewController()]
    
    lazy var tabBar = TYTabPagerBar()
    lazy var pagerController = TYPagerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpNaviView()
        addTabPagerBar()
        addPagerController()
        reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        self.tabBar.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height:40)
        self.pagerController.view.frame = CGRect(x: 0, y: 40, width: KScreenWidth, height: KScreenHeight - KUIStatusBarHeight - KUINavigationBarHeight - KUITabBarHeight)
    }
    
    func addTabPagerBar() {
        let tabbar = TYTabPagerBar()
        tabbar.delegate = self
        tabbar.dataSource = self
        tabbar .register(TYTabPagerBarCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(TYTabPagerBarCell.classForCoder()))
        tabbar.layout.barStyle = .progressView
        tabbar.backgroundColor = KCOLOR_BAR_TINT
        tabbar.layout.normalTextFont = KFontSize(FONT_SAMLL)
        tabbar.layout.selectedTextFont = KFontSize(FONT_MIDDLE)
        tabbar.layout.normalTextColor = KCOLOR_TEXT_GRAY1
        tabbar.layout.selectedTextColor = KCOLOR_TEXT_WHITE
        tabbar.layout.progressColor = UIColor.clear
        tabbar.layout.cellEdging = 10
        tabbar.layout.cellSpacing = 0
//        tabbar.layout.progressVerEdging = 10
        tabbar.layout.adjustContentCellsCenter = true
        tabbar.layout.adjustContentCellsCenterInBar()
        view.addSubview(tabbar)
        self.tabBar = tabbar
    }
    
    func addPagerController() {
        let pagerController = TYPagerController()
        pagerController.layout.addVisibleItemOnlyWhenScrollAnimatedEnd = true
        pagerController.view.backgroundColor = UIColor.white
        pagerController.delegate = self
        pagerController.dataSource = self
        addChildViewController(pagerController)
        view.addSubview(pagerController.view)
        self.pagerController = pagerController
    }
    
    func reloadData() {
        self.tabBar.reloadData()
        self.pagerController.reloadData()
    }
}

extension DYHomeViewController: TYTabPagerBarDataSource , TYTabPagerBarDelegate {
    
    func numberOfItemsInPagerTabBar() -> Int {
        return titles.count
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, cellForItemAt index: Int) -> UICollectionViewCell & TYTabPagerBarCellProtocol {
        let cell = pagerTabBar.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TYTabPagerBarCell.classForCoder()), for: index)
        cell.titleLabel.text = titles[index]
        return cell
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, widthForItemAt index: Int) -> CGFloat {
        let title = titles[index]
        return pagerTabBar.cellWidth(forTitle: title)
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, didSelectItemAt index: Int) {
        self.pagerController.scrollToController(at: index, animate: true);
    }
}

extension DYHomeViewController : TYPagerControllerDataSource , TYPagerControllerDelegate {
    func numberOfControllersInPagerController() -> Int {
        return titles.count
    }
    
    func pagerController(_ pagerController: TYPagerController, controllerFor index: Int, prefetching: Bool) -> UIViewController {
        let vc = controllers[index]
//        vc.view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        return vc
    }
    
    func pagerController(_ pagerController: TYPagerController, transitionFrom fromIndex: Int, to toIndex: Int, animated: Bool) {
        self.tabBar.scrollToItem(from: fromIndex, to: toIndex, animate: animated)
    }
    
    func pagerController(_ pagerController: TYPagerController, transitionFrom fromIndex: Int, to toIndex: Int, progress: CGFloat) {
        self.tabBar.scrollToItem(from: fromIndex, to: toIndex, progress: progress)
    }
}
