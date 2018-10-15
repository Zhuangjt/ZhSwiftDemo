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
        self.selectionStyle = .none
        self.accessoryType = .none
        self.contentView.backgroundColor = UIColor.white
        
        setUpUI()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.accessoryType = .none
        self.contentView.backgroundColor = UIColor.white
        
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
        return UITableViewAutomaticDimension  //自适应单元格高度
    }
    
    
    //取cell identifier
    public class func identifier() -> String{
        return String(describing: self)
    }
}
