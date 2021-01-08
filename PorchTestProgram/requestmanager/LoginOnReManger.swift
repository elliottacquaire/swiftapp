//
//  LoginOnReManger.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import RxSwift

final class LoginOnReManger : ObservableObject{
    
    let disposeBag = DisposeBag()
    
    
    init() {
        //        getVerCode(phoneNum: "183341")
        print("ssss-")
        //        loginOn(phoneNum: "sss", verCode: "eoeo")
        
        //        loginOnProvider.rx.request(.loginRequest(phoneNum: "13", verCode: "688"))
        //        .asObservable()
        //            .mapModel(BaseModel<LoginOnBean>.self)
        //        .subscribe(onNext: {result in
        //            print(result.data?.accessToken as Any)
        //        }, onError: {(e) in
        //             print(e)
        //        },onCompleted: {
        //             print("complete-")
        //            }).disposed(by:disposeBag)
        
        
        //            .subscribe(onNext: {(model) in
        //                print("---\(model)")
        //            }, onError: {
        //                (error) in  print("---\(error)")
        //            }, onCompleted: {(como) in print("---\(como)")} )
        
        
        //        .subscribe { (event) in
        //         //当event.element 不为空时，返回的就是我们之前mapModel的类
        //        if let model = event.element{
        //            print("---\(String(describing: model.data?.accessToken))")
        ////             LLog(model.data.crowdToken);
        //        }else{
        ////            LLog("当前事件:\(event)")
        //            print("---\(event)")
        //        }
        //        }
        //        .disposed(by: DisposeBag())
        
        
        //        .subscribe { event in
        //            switch event {
        //            case let .success(response):
        //                image = UIImage(data: response.data)
        //            case let .error(error):
        //                print(error)
        //            }
        //        }
        
        //          loginOnProvider.request(.loginRequest(phoneNum: "1", verCode: "6")) { result in
        //            print("-----\(result)")
        //            if case let .success(response) = result {
        //                        //解析数据
        //                        let data = try? response.mapJSON()
        //                 let str = String(data: response.data, encoding: String.Encoding.utf8)
        ////                        let json = JSON(data!)
        //                 print("--sss---\(str)")
        //                print("ddd-----\(data)")
        //                        //swift 自带序列化方法 需要实现 Decodable 协议 所有的子类及自身
        //        //                let ddd = try! JSONDecoder().decode(MusicModel.self, from: response.data)
        //                        //刷新表格数据
        ////                        DispatchQueue.main.async{
        ////                            self.musicModel = MusicModel.init(jsonData: json)
        ////                            self.music = models.channels
        ////                        }
        //                    }
        //                }
        
        
        
        
        
    }
    
    // get 验证码
    func getVerCode(phoneNum : String) {
        loginOnProvider.rx.request(.getVerCode(phoneNum: phoneNum))
            .asObservable()
            .mapModel(BaseModel<String>.self)
            .subscribe(onNext: {result in
                print(result.data as Any)
            }, onError: {(e) in
                print(e)
            },onCompleted: {
                print("cete-")
            }).disposed(by: disposeBag)
    }
    
    
    
    
    //login
    func loginOn(phoneNum : String,verCode : String) {
        print("00000---\(phoneNum)")
        loginOnProvider.rx.request(.loginRequest(phoneNum: phoneNum, verCode: verCode))
            .asObservable()
            .mapModel(BaseModel<LoginOnBean>.self)
            .subscribe(onNext: {result in
                print(result.data?.accessToken as Any)
                UserDefaults.standard.set(result.data?.accessToken, forKey: "token")
                UserDefaults.standard.set(phoneNum, forKey: "phone")
                let tok = UserDefaults.standard.string(forKey: "token")
                print("-token--\(String(describing: tok))")
                let scene = UIApplication.shared.connectedScenes.first
                if let sceneDelegate : SceneDelegate = scene?.delegate as? SceneDelegate{
                    if let view = sceneDelegate.window?.rootViewController?.view{
                        //                                 view.makeToast("Text")
                       
                        view.makeToast(tok, duration: 3.0, position: .center, title: "Toast Title", image:  UIImage(systemName: "star.fill"))
                    }
                }
            }, onError: {(e) in
                print(e)
            },onCompleted: {
                print("complete-")
            }).disposed(by:disposeBag)
    }
    
    
    
    
}
