//
//  DYClassifyItemCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/9.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit


class DYClassifyItemCell: BaseCollectionViewCell {
    
    var model: RecomCateList? {
        didSet{
            labName.text = model?.cate2_name
            contentImg.kf.setImage(with:URL.init(string: model?.square_icon_url ?? ""))
        }
    }
    
    lazy var contentImg: UIImageView = {
        let contentImg = UIImageView()
        return contentImg
    }()
    
    lazy var labName: UILabel = {
        let labName = UILabel.quickCreateLabel(text: "王者荣耀", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_SUPER_SMALL))
        labName.textAlignment = NSTextAlignment.center
        return labName
    }()
    
    lazy var ivDiviceline1: UIImageView = {
       let ivDiviceline1 = UIImageView()
        ivDiviceline1.backgroundColor = KCOLOR_LINE_GRAY1
        return ivDiviceline1
    }()
    
    lazy var ivDiviceline2: UIImageView = {
        let ivDiviceline2 = UIImageView()
        ivDiviceline2.backgroundColor = KCOLOR_LINE_GRAY1;
        return ivDiviceline2
    }()
    
    override func setUpUI() {
        super.setUpUI()
        
        addSubview(contentImg)
        addSubview(labName)
        addSubview(ivDiviceline1)
        addSubview(ivDiviceline2)
        
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
        
        ivDiviceline1.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        ivDiviceline2.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(0)
            make.width.equalTo(0.5)
        }
        
    }
}
