//
//  DYClassifyHeaderView.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/19.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class DYClassifyHeaderView: BaseView {

    private lazy var label: UILabel = {
       let label = UILabel.quickCreateLabel(text: "推荐分类", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_MIDDLE))
       return label
    }()
    
    override func setUpUI() {
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(KAutoLayoutWidth(12))
            make.centerY.equalTo(self)
        }
    }

}
