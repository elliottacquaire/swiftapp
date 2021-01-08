//
//  Toast.swift
//  PorchTestProgram
//
//  Created by Elliott on 2021/1/4.
//  Copyright © 2021 ElliottTest. All rights reserved.
//

import Foundation
import SwiftUI

//struct Toast: ViewModifier {
    
//    @Binding var show: Bool //是否显示
//    @Binding var title: String //显示文字
    
//    func body(content: Content) -> some View {
//        GeometryReader { geo in
//            ZStack(){
//                content.zIndex(0).disabled(show)
//
//                //防止多次点击 .disabled(show)
//                VStack {
//                    HStack {
//                        Text(title)
//                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(Color.white)
//                    }
//                    .background(Color.black.opacity(0.4)).cornerRadius(5)
//                    .frame(maxWidth: geo.size.width - 100)
//                }
//                .frame(width: geo.size.width, height: geo.size.height)
//                .background(Color.clear)
//                .zIndex(1)
//                .opacity((show) ? 1 : 0)
//                .animation(.easeIn(duration: 0.25)) //动画
//            }
//
//            .onChange(of: show) { e in
//                if(e){
//                    //消失
//                    after(3) {
//                        show.toggle()
//                    }
//                }
//            }
//        }
//    }
//}

//extension View {
//    func toast(show: Binding<Bool>, title: Binding<String>) -> some View {
//        self.modifier(Toast(show: show, title: title))
//    }
//}


extension View {
    func toast(isShow:Binding<Bool>, info:String = "",  duration:Double = 0.5) -> some View {
        ZStack {
            self
            if isShow.wrappedValue {
                ToastView(isShow:isShow, info: info, duration: duration)
            }
        }
        
     }
        
}
