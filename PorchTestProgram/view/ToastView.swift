//
//  ToastView.swift
//  PorchTestProgram
//
//  Created by Elliott on 2021/1/7.
//  Copyright © 2021 ElliottTest. All rights reserved.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var isShow:Bool
       let info: String
       
       init(isShow:Binding<Bool>,info: String = "", duration:Double = 3) {
           self._isShow = isShow
           self.info = info

           changeShow(duration: duration)
       }

       private func changeShow(duration:Double) {
           DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
               self.isShow = false
           }
       }
    
    var body: some View {
         ZStack {
                   Text(info)
                       .foregroundColor(.white)
                       .frame(minWidth: 80, alignment: Alignment.center)
                       .zIndex(1.0)
                       .padding()
                       .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.black))
                   
               }
               .padding()
               .animation(.easeIn(duration: 0.3))
               .edgesIgnoringSafeArea(.all)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(isShow: .constant(true), info: "ToastView")
    }
}
