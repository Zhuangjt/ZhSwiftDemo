//
//  BaseTableViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/1.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController {

    /// tableview
    var tableView: UITableView!
    /// cell 行高
    var cellHeight: CGFloat! = 45.0
    /// 是否显示空数据图
    var isShowEmpty: Bool?
    /// 空数据图图片
    var errorImage: String?
    /// 空数据图偏移量
    var offset: CGFloat?
    
    
    override var viewModel: BaseTableViewModel{
        return BaseTableViewModel()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupSubViews() {
        super.setupSubViews()
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        //设置数据源
        tableView.dataSource = self
        //设置数据源
        tableView.delegate = self
        //注册
        tableView .zh_regisiterCell(cell: UITableViewCell.self)
        
        view.addSubview(tableView)
        self.tableView = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override func bindViewModel() {
        
    }

    //刷新数据
    func reloadTableViewData() {
        
    }
    
    //下拉刷新
    func pullDownToRefresh() {
        
    }
    
    //上拉刷新
    func pullUpToRefresh() {
        
    }
}

extension BaseTableViewController: UITableViewDataSource,UITableViewDelegate{
    
    //sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModel.shouldMultiSections {
            return viewModel.dataSource.isEmpty ? 1 : viewModel.dataSource.count
        }
        return 1
    }
    
    //row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.shouldMultiSections {
            return viewModel.dataSource[section].count
        }
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewDuqueueReusableCell(tableView: tableView, identifier: "UITableViewCell", indexPath: indexPath)
        var object: AnyObject?
        if viewModel.shouldMultiSections {
            object = viewModel.dataSource[indexPath.section][indexPath.row]
        }else{
            object = viewModel.dataSource[indexPath.row]
         }
        return cell
    }
    
    //config
    func configureCell(cell: UITableViewCell, indexPath: IndexPath, object: AnyObject) {
    }
    
    //duqueueReusavleCell
    func tableViewDuqueueReusableCell(tableView: UITableView, identifier: String, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}

