//
//  BackLogRequestManager.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import RxSwift
import Toast_Swift

class BackLogRequestManager : ObservableObject{
    
    let disposeBag = DisposeBag()
    @Published var listItemData: BaseModel<BackLogListModel>?
    @Published var sData : Statess<Any>.Type?
    @Published var backlogModel : BackLogListModel = BackLogListModel()
    @Published var historyListModel  = ApprovalListModel()
    
    @Published var flag = 0
    
    init() {
        print("BackLogRequestManager------")
    }
    
    func requestBackLogApprovalList(requestData : BackLogRequestData){
        self.flag = 0
        backLogRequestProvider.rx
            .request(.requestBackLogApprovalList(requestData: requestData))
            .asObservable()
            .mapModel(BaseModel<BackLogListModel>.self)
            .subscribe(onNext: {result in
                print(result.toJSONString())
                
                guard let code = result.code, code < 300 else {
                    print("code --- \(result.code)")
                    var style = ToastStyle()
                    style.cornerRadius = 0
                    
                    let scene = UIApplication.shared.connectedScenes.first
                    if let sceneDelegate : SceneDelegate = scene?.delegate as? SceneDelegate{
                        if let view = sceneDelegate.window?.rootViewController?.view{
                            view.makeToast(result.message,duration: 2,position: .center,style: style)
                        }
                    }
                    return
                }
                
                
                self.flag = 1
                guard let data = result.data else {
                    print("data request is nil please check the network esstiansl")
                    return
                }
                self.backlogModel = data
                
                //                sData = States.loaded(result.data)
            }, onError: {error in
                print(error)
                self.flag = 2
            }, onCompleted: {
                print("complented")
                
            }, onDisposed: nil).disposed(by: disposeBag)
        
    }
    
    private func onNext(){
        
    }
    
    func requestSubmiterList() {
        print("---main start---")
        backLogRequestProvider.rx
            .request(.requestSubmiterList)
            .asObservable()
            .mapModel(BaseModel<Array<SubmitListModel>>.self)
            .subscribe(onNext: {result in print(result.data?[0].submitUserName)}, onError: {error in print(error)}, onCompleted: {print("completed")}, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func requestApprovalHistoryList(requestData : BackLogRequestData){
        self.flag = 0
        backLogRequestProvider.rx
            .request(.requestHistoryList(requestData: requestData))
            .asObservable()
            .mapModel(BaseModel<ApprovalListModel>.self)
            .subscribe(onNext: {result in
                self.flag = 1
                self.historyListModel = result.data!
                
            }, onError: {
                error in
                print(error)
                self.flag = 2
                
            }, onCompleted: { print("complented")}, onDisposed: nil).disposed(by: disposeBag)
    }
    
    
    
}

extension BackLogRequestManager{
    
    public enum States<T>{
        case notRequested
        case isLoading(last: T?)
        case loaded(T?)
        case failed(Error)
    }
}
