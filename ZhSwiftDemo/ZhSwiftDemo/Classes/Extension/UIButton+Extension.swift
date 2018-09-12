//
//  UIButton+Extension.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/9.
//  Copyright © 2018年 Zhuang. All rights reserved.
//  UIButton 扩展

import UIKit

// MARK:- 常量
fileprivate struct Metric {
  static let nav_button_min_width: CGFloat = 40.0
  static let nav_button_min_height: CGFloat = 40.0
  static let nav_bar_height: CGFloat = 44.0
}

extension UIButton{
    
    //导航栏图片按钮
    func initNavigationButton(image: UIImage?) -> UIButton {
        let button: UIButton = UIButton(type: .custom)
        var buttonWidth: CGFloat = 0
        if image != nil {
            buttonWidth = image!.size.width
        }
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonWidth, height:Metric.nav_bar_height)
        if buttonFrame.size.width >= Metric.nav_button_min_width {
            buttonFrame.size.width = Metric.nav_button_min_width
        }
        if buttonFrame.size.height >= Metric.nav_button_min_height {
            buttonFrame.size.height = Metric.nav_button_min_height
        }
        button.frame = buttonFrame
        button.contentMode = .scaleAspectFit
        button.backgroundColor = UIColor.clear
        button.setImage(image, for: .normal)
        return button
    }
    
    //导航栏文字按钮
    func initNavigationButtonWithTitle(title: String, color: UIColor) -> UIButton {
        let button: UIButton = UIButton(type: .custom)
        let titleSize = title.boundingRect(with: CGSize(width: 999999.0, height: Metric.nav_bar_height), options: .usesLineFragmentOrigin, attributes:([NSAttributedStringKey.font: KFontSize(16)]) , context: nil) .size
        button.frame = CGRect(x: 0, y: 0, width: titleSize.width, height: Metric.nav_bar_height)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = KFontSize(16)
        button.setTitleColor(color, for: .normal)
        button.setTitle(title, for: .normal)
        return button
        
    }
}
