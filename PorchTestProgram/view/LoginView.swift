//
//  LoginView.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI
import Toast_Swift

struct LoginView: View {
    
    @ObservedObject var LoginOnManager = LoginOnReManger()
    @State var codeVer : String = ""
//    @State var phone : String = ""
    
    
    @State var showToast = false
     @State var showingDetail = false
    
    @State var codeText : String = "获取验证码"
    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
//        ScrollView(){
        VStack(alignment: .leading){
                        Text("Porsche Dealer")
                            .bold()
                            .font(.system(size: 24))
                            .foregroundColor(Color(red: 0.0, green: 1.0, blue: 1.0, opacity: 1.0))
                            .padding(EdgeInsets(top: 80, leading: 0, bottom: 48, trailing: 0))
                           .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .center)
             
                        
                        
                        Text("短信快捷登录")
                       .font(.system(size: 18))
                            .foregroundColor(Color(red: 1.0, green: 0.0, blue: 1.0, opacity: 0.49))
                           .padding(EdgeInsets(top: 0, leading: 0, bottom: 39, trailing: 0))
                            
                        
                        HStack{
                            Text("手机号")
                                 .font(.system(size: 16)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 18))
                            
                            TextField("请输入手机号", text: self.$timerManager.phone, onEditingChanged: {change in
                                
                                print("onedit--\(self.$timerManager.phone)")
                            }, onCommit: {print("iiisss")})
                             .font(.system(size: 12))
                            .lineLimit(1)
                                .keyboardType(.numberPad)
                            .onTapGesture {
                                                    self.endEditing()
                                           }
                           
                            
                        }
                        Divider().padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                        
                        HStack{
                            Text("验证码") .font(.system(size: 16)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 18))
                            
                            TextField("请输入短信验证码", text: self.$codeVer)
                             .font(.system(size: 12))
                                 .lineLimit(1)
                                .foregroundColor(Color(hex: color1b2, alpha: 0.5))
                                .keyboardType(.numberPad)
                                .onTapGesture {
                                     self.endEditing()
                            }
                            
                            Button(action: {
                               
                                checkUserTelNumber(telNumber: self.timerManager.phone)
            //                    countDown(count: 60)
                                self.timerManager.start()


                            }){
                                Text("\(self.timerManager.codeText)")
                                    .multilineTextAlignment(.center)
                                    .lineLimit(1)
                                    .padding(5)
                                     .font(.system(size: 12))
                                    .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.8, opacity: 1.0))
                                    .frame(width: 80, height: 34)
                                    .border(Color(red: 0.25, green: 0.6, blue: 0.8, opacity: 1.0))
                                
                                } .foregroundColor(Color.gray)
                            .onReceive(timer){ time in
                                           if self.timeRemaining > 0 {
                                               self.timeRemaining -= 1
                                            self.codeText = String(self.timeRemaining)+"s"
                                            
                                           }else{
                                            self.codeText = "获取验证码"
                                }
                            
                            }
                            
                        }
                        Divider()
                        
                        
                        Button(action:{
                            //跳转
//                                   self.present(destination, animated: true, completion: nil)
//                            self.LoginOnManager.loginOn(phoneNum: self.timerManager.phone, verCode: self.codeVer)
                            print("颜色背景的按钮")
                              checkUserTelNumber(telNumber: self.timerManager.phone)
                            
                             self.showToast.toggle()
                              self.showingDetail.toggle()
                            
                            let scene = UIApplication.shared.connectedScenes.first
                            if let sceneDelegate : SceneDelegate = scene?.delegate as? SceneDelegate{
                               if let view = sceneDelegate.window?.rootViewController?.view{
//                                 view.makeToast("Text")
                                 print("---toast---")
                                view.makeToast("This is a piece of toast", duration: 3.0, position: .center, title: "Toast Title", image:  UIImage(systemName: "star.fill"))
                             }
                            }
                            
                            
                        }){
                            Text("立即登录")
                            .tracking(6)
            //                    .kerning(5.0)
                                .foregroundColor(Color(hex: colorWhite))
                                .font(.system(size: 14))
                                .frame(minWidth: .none, maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
                              .background(Color(hex: color196))
            //                    .background(UIColor(hexString: "#196A99"))
                            .border(Color(hex: colorWhite))
                            
                              
                            
                            
                            }
                        .padding(EdgeInsets(top: 38, leading: 0, bottom: 0, trailing: 0))
//                         .toast(isShow: $showToast, info: "请求成功")
                            .sheet(isPresented: $showingDetail, content: {MainTabView()})
            
            
                        Spacer()
                        
                        
                    }.padding(16)
            .edgesIgnoringSafeArea(.all)
//        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//            .frame(width: 300, height: 500, alignment: .topLeading)
//         .alignmentGuide(VerticalAlignment.top, computeValue: {_ in 10 })
//                        .offset(y: 30).animation(.easeInOut(duration: 1.0))
               
                    
//        }
//        .alignmentGuide(VerticalAlignment.top, computeValue: {_ in 600 })
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
