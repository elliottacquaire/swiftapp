//
//  AuthPlugin.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/31.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import Moya

/**
 prepare：准备发起请求。我们可以在这里对请求进行修改，比如再增加一些额外的参数。
 willSend：开始发起请求。我们可以在这里显示网络状态指示器。
 didReceive：收到请求响应。我们可以在这里根据结果自动进行一些处理，比如请求失败时将失败信息告诉用户，或者记录到日志中。
 process：处理请求结果。我们可以在 completion 前对结果进行进一步处理
 */

struct AuthPlugin : PluginType {
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        print("--准备发起请求--")
        
        //1.guard必须使用在函数内部
//        2.guard必须带有else语句，语法格式如下：
//            当条件表达式为true时，跳过else中的内容，执行后面的内容
//            当条件表达式为false时，执行else中的内容，跳转语句一般是return、break、continue、
//        Swift 中因为有optional， 经常需要判断是否为空，如果没有if let-----if let v = str{} ////guard let v = str else { return }
        
        guard let token = UserDefaults.standard.string(forKey: "token")  else {
            print("token-----kong---")
            return request
        }
        
        var request = request
         //将token添加到请求头中
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        print("token-----\(token)---")
        return request
        
    }
    
    func willSend(_ request: RequestType, target: TargetType) {
          print("--开始发起请求--")
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
          print("--收到请求响应--")
    }
    
//    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
//          print("--处理请求结果--")
//
//    }

}
