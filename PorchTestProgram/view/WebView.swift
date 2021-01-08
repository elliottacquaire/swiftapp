//
//  WebView.swift
//  PorchTestProgram
//
//  Created by Elliott on 2021/1/8.
//  Copyright © 2021 ElliottTest. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
           return WKWebView()
       }
       
       func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
           let request = URLRequest(url:URL(string: "https://www.baidu.com")!)
           uiView.load(request)
       }
}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}
