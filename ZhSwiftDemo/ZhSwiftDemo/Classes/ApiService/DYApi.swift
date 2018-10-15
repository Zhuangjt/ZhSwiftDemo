//
//  DYApi.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/18.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import Foundation

var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

let LoadingPlugin = NetworkActivityPlugin { (type, target) in
    guard let vc = topVC else { return }
    switch type {
    case .began:
        SVProgressHUD.show()
    case .ended:
        SVProgressHUD.dismiss()
    }
}

let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<HomeApi>.RequestResultClosure) -> Void in

    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<HomeApi>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<HomeApi>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])


enum HomeApi {
    case recommendCategoryList  //分类推荐列表
    case liveCategoryList     //分类列表
}

extension HomeApi : TargetType {
    var baseURL: URL {
        return URL.init(string: "https://apiv2.douyucdn.cn")!
    }
    
    var path: String {
        switch self {
        case .recommendCategoryList:
            return "/live/cate/getLiveRecommendCate2"
        case .liveCategoryList:
            return "/live/cate/getLiveCate1List"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommendCategoryList:
            return .get
        case .liveCategoryList:
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
        }
    }
    
    var headers: [String : String]? {
        return nil
    }

}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T{
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable?{
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(ResponseData<T>.self) else {
                completion(nil)
                return
            }
            completion(returnData?.data?.returnData)
        })
    }
}

