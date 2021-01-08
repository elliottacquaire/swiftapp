//
//  ContentView.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI
//import UIKit
//import Toast_Swift

struct ContentView: View {
     @State var showingDetails = "ds"
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:LoginView()){
                    Text(" start")
                }
                .navigationBarTitle("login")
                .navigationViewStyle(StackNavigationViewStyle())
                
                
                NavigationLink(destination: WebView()){
                    Text("Next view")
                        .font(.title)
                }//不显示title 便 不写字符串back
                    .navigationBarTitle("second")
                
                List {
                    NavigationLink(destination: MainTabView()){
                                       Text("Next view")
                                           .font(.title)
                    }
                        
                    NavigationLink(destination: MainTabView(), tag: 1, selection: $action){
                          Text("张三")
                    }
              
                Text("李四")
                Text("王五")
                }.accentColor(Color.red)

                
                Button(action:{
                    print("ssss")
                     self.action = 1
//                    self.showingDetail.toggle()
                }){
                    Text("Hello, World!  start")
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
