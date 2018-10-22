//
//  UIView+Extension.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/19.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation

extension UIView {

    /// 快速创建UILabel
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 字体颜色
    ///   - font: 字体大小
    /// - Returns: UILabel
    class func quickCreateLabel(text: String? , textColor: UIColor? ,font: UIFont?) -> UILabel{
        let label = UILabel()
        label.text = text
        if textColor != nil {label.textColor = textColor}
        if font != nil {label.font = font}
        return label
    }
    
    /// 快速创建UIButton
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 字体颜色
    ///   - font: 字体大小
    /// - Returns: UIButton
    class func quickCreateButton(text: String? , textColor: UIColor? ,font: UIFont?) ->UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        if textColor != nil {button.setTitleColor(textColor, for: .normal)}
        if font != nil {button.titleLabel?.font = font}
        return button
    }
    
    /// 圆角
    ///
    /// - Parameters:
    ///   - view: view
    ///   - radius: 圆角大小
    func viewRadius(view: UIView, radius: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
    }
    
    /// 圆角加边框
    ///
    /// - Parameters:
    ///   - view: view
    ///   - radius: 圆角大小
    ///   - width: 边框宽
    ///   - color: 边框颜色
    func viewBorderRadius(view: UIView, radius: CGFloat, width: CGFloat, color: UIColor) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }
    
}
