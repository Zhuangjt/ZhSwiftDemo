//
//  DYClassifyItemCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/9.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit


class DYClassifyItemCell: BaseCollectionViewCell {
    
    lazy var contentImg : UIImageView = {
        let contentImg = UIImageView()
        contentImg.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        return contentImg
    }()
    
    lazy var labName : UILabel = {
        let labName = UILabel.quickCreateLabel(text: "王者荣耀", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_SUPER_SMALL))
        labName.textAlignment = NSTextAlignment.center
        return labName
    }()
    
    override func setUpUI() {
        super.setUpUI()
        
        addSubview(contentImg);
        addSubview(labName)
        
        contentImg.snp.makeConstraints { (make) in
            make.top.equalTo(KAutoLayoutWidth(14))
            make.centerX.equalTo(self.contentView)
            make.size.equalTo(CGSize(width: KAutoLayoutWidth(KAutoLayoutWidth(60)), height: KAutoLayoutWidth(40)))
        }
        
        labName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(contentImg.snp.bottom).offset(10)
            make.left.equalTo(3)
            make.right.equalTo(-3)
        }
        
    }
}

