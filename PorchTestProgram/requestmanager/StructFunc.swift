//
//  StructFunc.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import HandyJSON
import RxSwift
import Moya

extension ObservableType where E == Response {
    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapModel(T.self))
        }
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
//        let jsonString = String.init(data: data, encoding: .utf8)
//        print("-first---\(jsonString)")
//         return JSONDeserializer<T>.deserializeFrom(json: jsonString)!
        guard let object = JSONDeserializer<T>.deserializeFrom(json: try mapString()) else {
            print("error -\(self)")
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
}

//字典转Data
public func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
    if (!JSONSerialization.isValidJSONObject(jsonDic)) {
        print("is not a valid json object")
        return nil
    }
    //利用自带的json库转换成Data
    //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
    let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
    //Data转换成String打印输出
    let str = String(data:data!, encoding: String.Encoding.utf8)
    //输出json字符串
    print("Json Str:\(str!)")
    return data
}

