//
//  BaseCollectionViewCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/16.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    //UI
    func setUpUI() {
        
    }
    
    func reloadData<T>(entity: T) {
        
    }
    
    func reloadDataWithIndexPath<T>(entity :T , indexPath: NSIndexPath) {
        
    }
    
    class func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell{
        var cell: UICollectionViewCell?
        let identifier = "BaseCollectionViewCell"
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell!
    }
}
