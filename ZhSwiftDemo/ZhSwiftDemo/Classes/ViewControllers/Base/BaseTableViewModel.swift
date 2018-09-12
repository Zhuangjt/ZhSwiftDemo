//
//  BaseTableViewModel.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/9.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class BaseTableViewModel: BaseViewModel {
    /// 数据源
    var dataSource: [AnyObject] = []
    /// tableView‘s style defalut is UITableViewStylePlain , 只适合 UITableView 有效
    var style: UITableViewStyle?
    /// 需要支持下来刷新 defalut is false
    var shouldPullDownToRefresh: Bool = false
    /// 需要支持上拉加载 defalut is false
    var shouldPullUpToRefresh: Bool = false
    /// 是否自动下拉刷新 defalut is false
    var autoPullUpToRefresh: Bool = false
    /// 是否数据是多段  defalut is false
    var shouldMultiSections: Bool = false
    ///当前页
    var page: Int = 1
    /// 每一页的数据大小
    var size: Int = 20
    ///空数据文案
    var empty: String?
    
    /// cell 点击事件
    func disSelectIndexPath(indexPath: IndexPath) {
        
    }
    
}
