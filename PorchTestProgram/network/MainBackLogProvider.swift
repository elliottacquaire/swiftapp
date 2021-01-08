//
//  MainBackLogProvider.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

let backLogRequestProvider = MoyaProvider<BackLogRequest>(plugins: [AuthPlugin()])

struct BackLogRequestData : HandyJSON {
    var flowType:Int = 0
    var currentStepStatus:Int = 0
    var stepAction:Int = 0
    var isHistory:Int = 0
    
}

 enum BackLogRequest{
//    case requestBackLogApprovalList(flowType:Int,currentStepStatus:Int,stepAction:Int,isHistory:Int)
    case requestBackLogApprovalList(requestData : BackLogRequestData)
    case requestSubmiterList
    case requestHistoryList(requestData : BackLogRequestData)
}

extension BackLogRequest : TargetType{
    public var baseURL: URL {
       return URL(string: "https://qa9.porsche-preview.cn/")!
    }
    
    public var path: String {
        switch self {
                case .requestBackLogApprovalList(_):
                    return "pdc-api-gateway/drs-mobile-bff/v1/mbff/appGroupList"
                case .requestSubmiterList:
                    return "pdc-api-gateway/drs-mobile-bff/v1/mbff/submitList"
        case .requestHistoryList(_):
            return "pdc-api-gateway/drs-mobile-bff/v1/mbff/appHistoryList"
                }
       
    }
    
    public var method: Moya.Method {
         switch self {
         case .requestBackLogApprovalList(_):
            return .post
         case .requestSubmiterList:
            return .get
         case .requestHistoryList(_):
            return .post
               default:
                   return .post
               }
    }
    
    public var sampleData: Data {
         return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
                case .requestBackLogApprovalList(let requestBackData):
        //            var params: Data = "{}".data(using: String.Encoding.utf8)!
                    var params: [String: Any] = [:]
//                    let paramss = BackLogRequestData.toJSON(requestBackData){ it in
//                        params = it
//                    }
                    
                    params = requestBackData.toJSON() ?? [:]
                    
//                    params["phone"] = phoneNum
        //            return .requestData(jsonToData(jsonDic: ["phone":phoneNum])!)
        //            return .requestData(params)
                    //两只都可以请求
                    return.requestParameters(parameters: params, encoding: JSONEncoding.default) //对应body ray json
                    
                case .requestSubmiterList:
//                    var params: [String: Any] = [:]
//                    params["verifyCode"] = verCode
//                    params["phone"] = phoneNum
//                    return .requestParameters(parameters: params, encoding: URLEncoding.default) //form
                    return .requestPlain
            
        case .requestHistoryList(let requestBackData):
            var params: [String: Any] = [:]
            params = requestBackData.toJSON() ?? [:]
             return.requestParameters(parameters: params, encoding: JSONEncoding.default)
            
                }
    }
    
    public var headers: [String : String]? {
         
                return ["Content-type": "application/json"]
//                'Authorization': 'Bearer ' + token
    }
    
    
}
