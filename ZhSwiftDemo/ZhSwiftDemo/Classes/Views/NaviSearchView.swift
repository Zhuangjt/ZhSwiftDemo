//
//  NaviSearchView.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/19.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

class NaviSearchView: BaseView {

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.font = KFontSize(FONT_SAMLL)
        textField.textColor = KCOLOR_TEXT_WHITE
        textField.placeholder = "请输入搜索内容"
        textField.setValue(KFontSize(FONT_SAMLL), forKeyPath: "_placeholderLabel.font")
        textField.setValue(KCOLOR_TEXT_GRAY1, forKeyPath: "_placeholderLabel.textColor")
        return textField
    }()
    
    private lazy var searchIcon: UIImageView = {
        let searchIcon = UIImageView()
        searchIcon.image = KImageName("dy_ic_navi_searchIcon")
        return searchIcon
    }()
    
    private lazy var qrcodeIcon: UIImageView = {
       let qrcodeIcon = UIImageView()
        qrcodeIcon.image = KImageName("dy_ic_navi_qrcodeIcon")
        return qrcodeIcon
        
    }()
    
    
    override func setUpUI() {
        
        addSubview(textField)
        addSubview(searchIcon)
        addSubview(qrcodeIcon)
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset((KAutoLayoutWidth(35)));
            make.right.equalTo(self).offset(KAutoLayoutWidth(-35));
            make.height.equalTo(30)
            make.center.equalTo(self.snp.center)
        }
        
        searchIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(5)
            make.width.height.equalTo(KAutoLayoutWidth(18))
        }
        
        qrcodeIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-5)
            make.size.equalTo(CGSize(width: KAutoLayoutWidth(26), height: KAutoLayoutWidth(26)))
        }
    }

}
