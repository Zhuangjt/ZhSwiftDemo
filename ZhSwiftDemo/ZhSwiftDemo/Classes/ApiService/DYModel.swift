//
//  DYModel.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/11.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation
import ObjectMapper

/// 首页--分类
class CateAllData: Mappable {
    var cate1_list: [CateOneList] = [CateOneList]()
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        cate1_list <- map["cate1_list"]
    }
}

class CateOneList: Mappable {
    var cate1_id: Int?
    var cate_name: String?
    var cate_count: Int?
    var cate2_list: [RecomCateList] = [RecomCateList]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        cate1_id <- map["cate1_id"]
        cate_name <- map["cate_name"]
        cate_count <- map["cate_count"]
        cate2_list <- map["cate2_list"]
    }
}

class RecomCateList: Mappable {
    var cate2_id: Int?
    var cate2_name: String?
    var cate2_short_name: String?
    var push_nearby: Int?
    var is_vertical: Int?
    var icon_url: String?
    var small_icon_url: String?
    var square_icon_url: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        cate2_id <- map["cate2_id"]
        cate2_name <- map["cate2_name"]
        cate2_short_name <- map["cate2_short_name"]
        push_nearby <- map["push_nearby"]
        is_vertical <- map["is_vertical"]
        icon_url <- map["icon_url"]
        small_icon_url <- map["small_icon_url"]
        square_icon_url <- map["square_icon_url"]
    }
}

class CateRecomData: Mappable {
    var total: Int?
    var cate2_list: [RecomCateList] = [RecomCateList]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        total <- map["total"]
        cate2_list <- map["cate2_list"]

    }
}

/// 首页--全部

class HomeAllData: Mappable {
    var roomRule: Int?
    var msg: String?
    var list: [HomeAllList] = [HomeAllList]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        roomRule <- map["roomRule"]
        msg <- map["msg"]
        list <- map["list"]
    }
}

class HomeAllList: Mappable {
    var room_id: Int?
    var room_name: String?
    var nickname: String?
    var cate_id: Int?
    var cate2_name: String?
    var room_src: String?
    var online_num: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        room_id <- map["room_id"]
        room_name <- map["room_name"]
        nickname <- map["nickname"]
        cate_id <- map["cate_id"]
        cate2_name <- map["cate2_name"]
        room_src <- map["room_src"]
        online_num <- map["online_num"]
    }
}

