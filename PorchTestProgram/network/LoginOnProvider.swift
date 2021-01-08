//
//  LoginOnProvider.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import Moya


let loginOnProvider = MoyaProvider<LoginOnRequest>()

public enum LoginOnRequest{
    case getVerCode(phoneNum : String)
    case loginRequest(phoneNum:String,verCode:String)
}

extension LoginOnRequest : TargetType{
    public var baseURL: URL {
        switch self {
        default:
            return URL(string: "https://qa9.porsche-preview.cn/")!
        }
    }
    
    public var path: String {
        switch self {
        case .getVerCode(_):
            return "pdc-api-gateway/drs-mobile-bff/v1/mbff/sms/code"
        case .loginRequest( _, _):
            return "pdc-api-gateway/drs-mobile-bff/v1/mbff/sms/token"
//        return "/users/\(name.urlEscaped)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    /**
     requestPlain 没有任何东西发送
     requestData(_? 可以发送 Data (useful for Encodable types in Swift 4)
     requestJSONEncodable(_?
     requestParameters(parameters:encoding:) 发送指定编码的参数
     requestCompositeData(bodyData:urlParameters:) & requestCompositeParameters(bodyParameters:bodyEncoding:urlParameters)
     
     .uploadFile(? 从一个URL上传文件, .uploadMultipart(? multipart 上传
     .uploadCompositeMultipart(_:urlParameters:) 允许您同时传递 multipart 数据和url参数
     
     .downloadDestination(_? 单纯的文件下载
     .downloadParameters(parameters:encoding:destination:) 请求中携带参数的下载。 下面,
     注意枚举中的sampleData属性。
     这是TargetType协议的一个必备属性。这个属性值可以用来后续的测试或者为开发者提供离线数据支持。这个属性值依赖于 self.
     */
    public var task: Task {
        switch self {
        case .getVerCode(let phoneNum):
//            var params: Data = "{}".data(using: String.Encoding.utf8)!
            var params: [String: Any] = [:]
            params["phone"] = phoneNum
//            return .requestData(jsonToData(jsonDic: ["phone":phoneNum])!)
//            return .requestData(params)
            //两只都可以请求
            return.requestParameters(parameters: params, encoding: JSONEncoding.default) //对应body ray json
            
        case .loginRequest(let phoneNum, let verCode):
            var params: [String: Any] = [:]
            params["verifyCode"] = verCode
            params["phone"] = phoneNum
            return .requestParameters(parameters: params, encoding: URLEncoding.default) //form
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getVerCode(_):
            return ["Content-type": "application/json"]
        default:
            return nil
        }
    }
    
    
}
