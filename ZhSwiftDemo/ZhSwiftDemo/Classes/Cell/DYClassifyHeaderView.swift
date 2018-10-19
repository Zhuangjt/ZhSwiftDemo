//
//  DYClassifyHeaderView.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/19.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class DYClassifyHeaderView: BaseView {
    lazy var labTitle: UILabel = {
       let label = UILabel.quickCreateLabel(text: "推荐分类", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_SAMLL))
       return label
    }()
    
    func configTitle(title: String?) {
        labTitle.text = title
    }
    
    override func setUpUI() {
        addSubview(labTitle)
        labTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(KAutoLayoutWidth(12))
            make.centerY.equalTo(self)
        }
    }

}
