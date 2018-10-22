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
    
    var data: [RecomCateList]?  {
        didSet{
            collectionView.reloadData()
        }
    }

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = KHexColor("E9E9E9")
        pageControl.currentPageIndicatorTintColor = KHexColor("CECECE")
        return pageControl
    }()

    lazy var collectionView: UICollectionView = {
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
    
    lazy var ivDiviceline1: UIImageView = {
        let ivDiviceline1 = UIImageView()
        ivDiviceline1.backgroundColor = KCOLOR_LINE_GRAY1
        return ivDiviceline1
    }()
    
    lazy var ivDiviceline2: UIImageView  = {
        let ivDiviceline2 = UIImageView()
        ivDiviceline2.backgroundColor = KCOLOR_LINE_GRAY1
        return ivDiviceline2
    }()

    override func setUpUI() {
        addSubview(pageControl)
        addSubview(collectionView)
        addSubview(ivDiviceline1)
        addSubview(ivDiviceline2)

        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(collectionViewH)
        }

        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.width.equalTo(150)
        }
        
        ivDiviceline1.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        ivDiviceline2.snp.makeConstraints { (make) in
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
        if data == nil {return 0}
        let number: Int = (data!.count - 1) / 8 + 1
        pageControl.numberOfPages = number
        pageControl.isHidden = number <= 1 ? true :false
        return number
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.zh_dequeueReusableCell(cell: DYClassifyCollCell.self, indexPath: indexPath)
        let startIndex = indexPath.row * 8
        var endIndex = (indexPath.row + 1) * 8 - 1
        if endIndex > data!.count - 1 {
            endIndex = data!.count - 1
        }
        if (self.data?.count)! > 0 {
            cell.data = Array(data![startIndex...endIndex])
        }
        return cell
    }
}
