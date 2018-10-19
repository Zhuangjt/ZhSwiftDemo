//
//  ZhNetWork.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/22.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation
import Moya


struct ZHNetwork {
    // 请求成功的回调
    typealias successCallback = (_ result: Any) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    
    // 单例
    static let provider = MoyaProvider<ZHService>()
    
    // 发送网络请求
    static func request(
        target: ZHService,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
        
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success(moyaResponse.mapJSON()) // 测试用JSON数据
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}

enum ZHService {
    case demo1
    case demo2(name: String)
    case demo3(name: String, score: Int)
}

extension ZHService: TargetType {
    var sampleData: Data {
        switch self {
        case .demo1, .demo3:
            return "just for test".utf8Encoded
        case .demo2(let name):
            return "{\"name\": \(name)\"}".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .demo1:
            return .requestPlain // 无参数
        case let .demo2(name): // 带有参数,注意前面的let
            return .requestParameters(parameters: ["name" : name], encoding: URLEncoding.default)
        case let .demo3(name, score): // 带有参数,注意前面的let
            return .requestParameters(parameters: ["name" : name, "score" : score], encoding: URLEncoding.default)
        }
    }
    
    // 请求服务器的根路径
    var baseURL: URL { return URL.init(string: "https://httpbin.org")! }
    
    // 每个API对应的具体路径
    var path: String {
        switch self {
        case .demo1:
            return "/get"
        case .demo2(name: _), .demo3(name: _, score: _):
            return "/post"
        }
    }
    
    // 各个接口的请求方式
    var  method: Moya.Method {
        switch self {
        case .demo1:
            return .get
        case .demo2, .demo3:
            return .post
        }
    }
    
    // 请求头
    var headers: [String : String]? {
        return ["Content-type" : "application/json" ]
    }
    
}

private extension String{
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
