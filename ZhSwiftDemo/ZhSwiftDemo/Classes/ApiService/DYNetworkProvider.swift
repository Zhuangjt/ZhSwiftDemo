//
//  DYNetworkProvider.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/15.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit
import Moya
import Result
import SwiftyJSON
import ObjectMapper

///成功
typealias SuccessStringClosure = (_ result : String) -> Void
typealias SuccessModelClosure = (_ result : Mappable?) -> Void
typealias SuccessArrModelClosure = (_ result : [Mappable]?) -> Void
typealias SuccessJSONClosure = (_ result : JSON) -> Void
///失败
typealias FailClosure = (_ errorMsg : String?) -> Void


public class DYNetworkProvider{
    ///共享实例
    static let shared = DYNetworkProvider()
    private init(){}
    private var failInfo = ""
    
    /// 请求JSON数据 有WaitingDialog
    func requestDataWithTargetJSONHasDiaLog<T:TargetType>(target : T, successClosure: @escaping SuccessJSONClosure, failClosure: @escaping FailClosure ) {
        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target), plugins:[networkPlugin()])
        let _ = requestProvider.request(target) { (result) -> () in
            switch result{
            case let .success(response):
                do {
                    let mapjson = try response.mapJSON()
                    let json = JSON(mapjson)
                    guard let _ = json.dictionaryObject else{
                        failClosure(self.failInfo)
                        return
                    }
                    successClosure(json["data"])
                } catch {
                    self.failInfo = "数据解析失败"
                    failClosure(self.failInfo)
                }
            case let .failure(error):
                self.failInfo = "无网络"
                failClosure(error.errorDescription)
            }
        }
    }
    
    /// 请求JSON数据 无WaitingDialog
    func requestDataWithTargetJSON<T:TargetType>(target : T, successClosure: @escaping SuccessJSONClosure, failClosure: @escaping FailClosure ) {
        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
        let _ = requestProvider.request(target) { (result) -> () in
            switch result{
            case let .success(response):
                do {
                    let mapjson = try response.mapJSON()
                    let json = JSON(mapjson)
                    guard let _ = json.dictionaryObject else{
                        failClosure(self.failInfo)
                        return
                    }
                    successClosure(json["data"])
                } catch {
                    self.failInfo = "数据解析失败"
                    failClosure(self.failInfo)
                }
            case let .failure(error):
                self.failInfo = "无网络"
                failClosure(error.errorDescription)
            }
        }
    }
    
    
    ///设置一个公共请求超时时间
    private func requestTimeoutClosure<T:TargetType>(target:T) -> MoyaProvider<T>.RequestClosure{
        let requestTimeoutClosure = { (endpoint:Endpoint, done: @escaping MoyaProvider<T>.RequestResultClosure) in
            do{
                var request = try endpoint.urlRequest()
                request.timeoutInterval = 20 //设置请求超时时间
                done(.success(request))
            }catch{
                return
            }
        }
        return requestTimeoutClosure
    }
    
    private func networkPlugin() -> NetworkActivityPlugin {
        //设置一个loading
        let networkPlugin = NetworkActivityPlugin { (type,target) in
            switch type {
            case .began:
                SVProgressHUD.show()
            case .ended:
                if self.failInfo.isEmpty {
                    SVProgressHUD.dismiss()
                }else{
                    SVProgressHUD.showError(withStatus: self.failInfo)
                }
            }
        }
        return networkPlugin
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}
