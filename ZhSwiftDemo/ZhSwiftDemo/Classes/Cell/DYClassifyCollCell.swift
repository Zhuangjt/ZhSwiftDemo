//
//  DYClassifyCollCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/11.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let itemH : CGFloat = (KScreenWidth-3) / 4.0

class DYClassifyCollCell: BaseCollectionViewCell {
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        layout.sectionInset = UIEdgeInsetsMake(0.5, 0, 0.5, 0)
        layout.itemSize = CGSize(width: itemH, height: itemH)
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.zh_registerCell(cell: DYClassifyItemCell.self)
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = KCOLOR_LINE_GRAY1
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
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DYClassifyItemCell.identifier(), for: indexPath)
        return cell
    }
}
