//
//  BaseCollectionViewModel.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/10.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class BaseCollectionViewModel: BaseViewModel {
    /// 数据源
    var dataScorce: [AnyObject] = []
    /// 需要支持下拉 default is false
    var shouldPullDownToRefresh: Bool = false
    /// 需要支持上拉刷新 default is false
    var shouldPullUpToRefresh: Bool = false
    /// 是否自动下拉刷新 default is false
    var autoPullTpToRefresh: Bool = false
    /// 是否分组
    var shouldMultiSecionts: Bool = false
    /// 当前页 default is 1
    var page: Int = 1
    /// 每一页的数据 default is 20
    var perPage: Int = 20
    ///空数据文案
    var empty:String?
    
    /// cell 点击事件
    func disSelectIndexPath(indexPath: IndexPath) {
        
    }
}
