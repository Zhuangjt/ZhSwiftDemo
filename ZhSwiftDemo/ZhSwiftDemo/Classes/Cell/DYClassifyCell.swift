//
//  DYClassifyCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/19.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let collectionViewH : CGFloat = KScreenWidth / 4.0 * 2.0

class DYClassifyCell: BaseTableViewCell {

    lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = KHexColor("E9E9E9")
        pageControl.currentPageIndicatorTintColor = KHexColor("CECECE")
        pageControl.numberOfPages = 2
        return pageControl
    }()

    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: KScreenWidth, height: collectionViewH)

        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView .zh_registerCell(cell: DYClassifyCollCell.self)
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var ivDiviceline : UIImageView  = {
        let ivDiviceline = UIImageView()
        ivDiviceline.backgroundColor = KCOLOR_LINE_GRAY1
        return ivDiviceline
    }()

    override func setUpUI() {
        addSubview(pageControl)
        addSubview(collectionView)
        addSubview(ivDiviceline)

        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(collectionViewH)
        }

        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.width.equalTo(150)
        }
        
        ivDiviceline.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(0.5)
        }
    }

}

extension DYClassifyCell : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page : Int = (Int)(collectionView.contentOffset.x / KScreenWidth)
        pageControl.currentPage = page
    }
}

extension DYClassifyCell : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DYClassifyCollCell.self), for: indexPath)
        return cell
    }
}
