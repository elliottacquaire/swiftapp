//
//  ButtonEx.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/28.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import SwiftUI

var codeTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.global())
 var isEnabled = false

extension Button{
     //倒计时启动

        func countDown(count: Int){

            // 倒计时开始,禁止点击事件

           
            
            var remainingCount: Int = count {

                willSet {

                    Text("\(newValue)秒重发")

                    if newValue <= 0 {

                        Text("获取验证码")

                    }

                }

            }

            if codeTimer.isCancelled {

                codeTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.global())

            }

            

            // 设定这个时间源是每秒循环一次，立即开始

            codeTimer.scheduleRepeating(deadline: .now(), interval: .seconds(1))

            // 设定时间源的触发事件

            codeTimer.setEventHandler(handler: {

                

                // 返回主线程处理一些事件，更新UI等等

                DispatchQueue.main.async {

                    // 每秒计时一次

                    remainingCount -= 1

                    // 时间到了取消时间源

                    if remainingCount <= 0 {

                        isEnabled = true

                        codeTimer.cancel()

                    }

                }

            })

            // 启动时间源

            codeTimer.resume()

        }

        //取消倒计时

        func countdownCancel() {

            if !codeTimer.isCancelled {

                codeTimer.cancel()

            }

            

            // 返回主线程

            DispatchQueue.main.async {

                isEnabled = true

//                if self.titleLabel?.text?.count != 0
//
//                {
//
//                    Text("获取验证码")
//
//                }

            }

        }

    }
