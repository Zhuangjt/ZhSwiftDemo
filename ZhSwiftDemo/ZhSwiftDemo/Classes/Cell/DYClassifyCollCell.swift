//
//  DYClassifyCollCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/11.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let itemH : CGFloat = KScreenWidth / 4.0

class DYClassifyCollCell: BaseCollectionViewCell {
    
    var data: [RecomCateList]?  {
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.itemSize = CGSize(width: itemH, height: itemH)
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.zh_registerCell(cell: DYClassifyItemCell.self)
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func setUpUI() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(0)
        }
    }
}

extension DYClassifyCollCell : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.zh_dequeueReusableCell(cell: DYClassifyItemCell.self, indexPath: indexPath)
        cell.backgroundColor = UIColor.red
        let model: RecomCateList? = data?[indexPath.row]
        cell.model = model
        return cell
    }
}
