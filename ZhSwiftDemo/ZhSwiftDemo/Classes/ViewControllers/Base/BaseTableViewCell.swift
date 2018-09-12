//
//  BaseTableViewCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/16.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }

    //UI
    func setUpUI(){
        
    }
    
    func reloadData<T>(entity: T) {
        
    }
    
    func reloadDataWithIndexPath<T>(entity :T , indexPath: NSIndexPath) {
        
    }
    
    class func cellWithTableView(tableView: UITableView) -> UITableViewCell {
        var cell: UITableViewCell?
        let identifier = "BaseTableViewCell"
        cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        return cell!
    }
    
    class func getTableViewCellHeightWithModel<T>(entity: T) -> CGFloat{
        return 0
    }
}
