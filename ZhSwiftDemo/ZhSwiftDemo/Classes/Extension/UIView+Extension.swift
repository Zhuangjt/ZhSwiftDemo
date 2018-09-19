//
//  UIView+Extension.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/19.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation

extension UIView {

    class func quickCreateLabel(text: String? , textColor: UIColor? ,font: UIFont?) -> UILabel{
        let label = UILabel()
        label.text = text
        if textColor != nil {label.textColor = textColor}
        if font != nil {label.font = font}
        return label
    }
    
    class func quickCreateButton(text: String? , textColor: UIColor? ,font: UIFont?) ->UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        if textColor != nil {button.setTitleColor(textColor, for: .normal)}
        if font != nil {button.titleLabel?.font = font}
        return button
    }
    
}
