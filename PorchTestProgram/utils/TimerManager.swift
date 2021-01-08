//
//  TimerManager.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/28.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation

class TimerManager : ObservableObject{
    var timeRemaining = 60
    var timer = Timer()
    @Published var codeText = "获取验证码"
    
    let characterLimit = 11
    
    @Published var phone = "" {
        didSet {           
            if phone.count > characterLimit{ //限定text filed 输入过长
                //                self.showWarning = true
                print("--input too long--")
            }else{
                //                self.showWarning = false
                
            }
            if phone.count > characterLimit && oldValue.count <= characterLimit {
                phone = oldValue
                //                self.showWarning = true
                print("input----")
            }
        }
    }
    
    init(){
         phone = UserDefaults.standard.string(forKey: "phone") ?? ""
        print("--phone--- \(phone)")
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.codeText = String(self.timeRemaining)+"s"
                
            }else{
                self.codeText = "获取验证码"
                timer.invalidate()
                self.timeRemaining = 60
                print("finished----")
            }
        }
    }
}
