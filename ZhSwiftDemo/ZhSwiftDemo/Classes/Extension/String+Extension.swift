//
//  String+Extension.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/16.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit

extension String{
    func isEmpty() -> Bool {
        return (self == nil || self.count == 0)
    }
}
