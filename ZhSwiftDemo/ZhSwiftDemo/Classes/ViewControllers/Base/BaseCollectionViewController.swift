//
//  BaseCollectionViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/10.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class BaseCollectionViewController: BaseViewController {
    
    /// collectionView
    var collectionView: UICollectionView!
    /// cell size
    var cellSize: CGSize! = CGSize(width: KScreenWidth, height: 45)
    /// 行间距 default 为 0
    var minimumLineSpacing: CGFloat! = 0
    /// 列间距 default 为 0
    var minimumInteritemSpacing: CGFloat! = 0
    /// 偏移量  default (0,0,0,0)
    var edg: UIEdgeInsets! = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    /// 滚动方向
    var scrollDirection: UICollectionViewScrollDirection?
    /// 是否显示空数据图
    var isShowEmpty: Bool?
    /// 空数据图片
    var errorImage: String?
    /// 空数据偏移量
    var offset: CGFloat?
    
//    override var viewModel: BaseCollectionViewModel{
//        return BaseCollectionViewModel()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupSubViews() {
        super.setupSubViews()
        
        let collectionView: UICollectionView!
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = cellSize
        //列间距,行间距,偏移'
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.sectionInset = edg
        
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        //注册cell
        collectionView! .zh_registerCell(cell: UICollectionViewCell.self)
        collectionView.backgroundColor = UIColor.clear
        self.collectionView = collectionView
        self.view.addSubview(self.collectionView)
        
    }
}

extension BaseCollectionViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
//        if viewModel.shouldMultiSecionts {
//            return viewModel.dataScorce.isEmpty ? 1 : viewModel.dataScorce.count
//        }
//        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
//        if viewModel.shouldMultiSecionts {
//            return viewModel.dataScorce[section].count
//        }
//        return viewModel.dataScorce.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        return cell
//        let cell = collectionViewDuqueueReusableCell(collectionView: collectionView, identifier: "UICollectionViewCell", indexPath: indexPath)
//        var object: AnyObject?
//        if viewModel.shouldMultiSecionts {
//            object = viewModel.dataScorce[indexPath.section][indexPath.row]
//        }else{
//            object = viewModel.dataScorce[indexPath.row]
//        }
//        return cell
    }
    
    //config
//    func configureCell(cell: UITableViewCell, indexPath: IndexPath, object: AnyObject) {
//    }
//
//    func collectionViewDuqueueReusableCell(collectionView: UICollectionView, identifier: String, indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
//    }
    
    
}
