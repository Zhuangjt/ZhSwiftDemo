//
//  DYApi.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/18.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation

enum DYApi {
    case recommendCategoryList  //分类推荐列表
    case liveCategoryList     //分类列表
    case liveAllList          //全部列表
    case hotActitytyList      //热门活动
}

extension DYApi : TargetType {
    var baseURL: URL {
        return URL.init(string: "https://apiv2.douyucdn.cn")!
    }
    
    var path: String {
        switch self {
        case .recommendCategoryList:
            return "/live/cate/getLiveRecommendCate2"
        case .liveCategoryList:
            return "/live/cate/getLiveCate1List"
        case .liveAllList:
            return "/gv2api/rkc/roomlist/0_0/0/20/ios"
        case .hotActitytyList:
            return "/Live/Subactivity/getActivityList"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommendCategoryList:
            return .get
        case .liveCategoryList:
            return .get
        case .liveAllList:
            return .get
        case .hotActitytyList:
            return .get
        }
    }
    
    var sampleData: Data {
        return "just for test".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .recommendCategoryList:
            return .requestParameters(parameters: ["client_sys":"ios"], encoding: URLEncoding.default)
        case .liveCategoryList:
            return .requestParameters(parameters: ["client_sys":"ios"], encoding: URLEncoding.default)
        case .liveAllList:
            return .requestParameters(parameters: ["client_sys":"ios"], encoding: URLEncoding.default)
        case .hotActitytyList:
            return .requestParameters(parameters: ["client_sys":"ios","cid2":"0"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

