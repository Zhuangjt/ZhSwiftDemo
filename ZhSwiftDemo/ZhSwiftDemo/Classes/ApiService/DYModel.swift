//
//  DYModel.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/11.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation


struct ReturnData<T: HandyJSON>: HandyJSON {
    var returnData: T?
}

struct ResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: ReturnData<T>?
}
