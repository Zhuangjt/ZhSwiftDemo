//
//  DYRecomHeaderView.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/22.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit

class DYRecomHeaderView: UICollectionReusableView {
    lazy var labTitle: UILabel = {
        let label = UILabel.quickCreateLabel(text: "热门推荐", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_MIDDLE))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labTitle)
        labTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(KAutoLayoutWidth(12))
            make.centerY.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
