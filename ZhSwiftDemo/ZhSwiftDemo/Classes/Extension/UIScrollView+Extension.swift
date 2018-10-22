//
//  UIScrollView+Extension.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/10.
//  Copyright © 2018年 Zhuang. All rights reserved.
//  UITableView/UICollectionView 注册 cell

import UIKit

protocol RegisterCellFromNib {
}

extension RegisterCellFromNib {
    static var identifier: String { return "\(self)"}
    static var nib: UINib? { return UINib(nibName: "\(self)", bundle: nil)}
}


extension UITableView {
//    /// 注册 cell 的方法
//    func zh_registerCell<T: UITableViewCell>(cell: T.Type) where T:  RegisterCellFromNib  {
//        if let nib = T.nib { register(nib, forCellReuseIdentifier: T.identifier)}
//        else { register(cell, forCellReuseIdentifier: T.identifier)}
//    }
//
//    /// 从缓存池取已经存在的 cell
//    func zh_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
//        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
//    }
    /// 注册cell
    func zh_regisiterCell<T: UITableViewCell>(cell: T.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell.self))
    }
    
    /// 从缓存池取已经存在的 cell
    func zh_dequeueReusableCell<T: UITableViewCell>(cell: T.Type ,indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: cell.self), for: indexPath) as! T
    }
}

extension UICollectionView{
//    /// 注册 cell 的方法
//    func zh_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: RegisterCellFromNib{
//        if let nib = T.nib { register(nib, forCellWithReuseIdentifier: T.identifier)}
//        else { register(cell, forCellWithReuseIdentifier: T.identifier)}
//    }
//
//    /// 从缓存池取已经存在的 cell
//    func zh_dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) ->T where T: RegisterCellFromNib {
//        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
//    }
//
//    /// 注册头部
//    func zh_registerSupplementaryHeaderView<T: UICollectionReusableView>(reusableView: T.Type) where T: RegisterCellFromNib {
//        // T 遵守了 RegisterCellOrNib 协议，所以通过 T 就能取出 identifier 这个属性
//        if let nib = T.nib {
//            register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier)
//        } else {
//            register(reusableView, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier)
//        }
//    }
//
//    /// 获取可重用的头部
//    func zh_dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
//        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as! T
//    }
    /// 注册cell
    func zh_registerCell<T: UICollectionViewCell>(cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: String(describing: cell.self))
    }
    
    /// 从缓存池取已经存在的 cell
    func zh_dequeueReusableCell<T: UICollectionViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cell.self), for: indexPath) as! T
    }
    
    /// 注册头部
    func zh_registerView<T: UICollectionReusableView>(kind: String, reusableView: T.Type){
        register(reusableView, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: reusableView.self))
    }
    
    /// 从缓冲池取已经存在的 reusableView
    func zh_dequeueReusableView<T: UICollectionReusableView>(kind: String, indexPath: IndexPath, resusableView:T.Type) -> T{
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: resusableView.self), for: indexPath) as! T
    }
}

