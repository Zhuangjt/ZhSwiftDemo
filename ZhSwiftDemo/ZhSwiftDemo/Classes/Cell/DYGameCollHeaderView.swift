//
//  DYGameCollHeaderView.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/22.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit

private let cellW: CGFloat = (KScreenWidth - 20)/4.0

class DYGameCollHeaderView: UICollectionReusableView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.itemSize = CGSize(width: cellW, height: cellW)
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.zh_registerCell(cell: DYGameCollCell.self)
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)

        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DYGameCollHeaderView: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.zh_dequeueReusableCell(cell: DYGameCollCell.self, indexPath: indexPath)
        return cell
    }
}
