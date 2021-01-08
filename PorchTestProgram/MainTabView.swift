//
//  MainTabView.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/21.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var viewModel = BackLogRequestManager()
    
    //enter room
    var body: some View {
        TabView{
            NavigationView {
                List(viewModel.backlogModel.groupResources,id: \.orderNo) { landmark in
                NavigationLink(destination: ContentView()){
                    Text("\(landmark.orderNo ?? "")")
                }
                }
                .navigationBarTitle("Landmarks---",displayMode: .inline)
                
                
                content
                Spacer()
                }
            .tabItem({
                Image(systemName: "house")
                Text("Home") })
                .tag(0)
                .onAppear(){
                    print("main view start appear")
                    var request = BackLogRequestData()
                    request.currentStepStatus = 1
                    request.stepAction = 1
                    request.isHistory = 0
                    request.flowType = 0
                    self.viewModel.requestBackLogApprovalList(requestData: request)
            }
            
            
            
            VStack{
//                NavigationView{
                    NavigationLink(destination: HistoryList()){
                                               Text("历史订单")
                                           }
                    Group{
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                        content
                       
                        
                                    }
//                }
                
            }.tabItem({
                Image(systemName: "star")
                Text("Star")
            }).tag(1)
            
            
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

private extension MainTabView{
    
    var content: AnyView {
        let data = $viewModel.flag.wrappedValue
        switch data {
        case 0:
            return AnyView(notRequestedView)
        case 1:
            return AnyView(loadingView)
//        case let .loaded(details):
//            return AnyView(loadedView(country: viewModel.country, details: details))
        case 2:
            return AnyView(notRequestedView)
        default:
             return AnyView(loadingView)
        }
    }
//     var content: AnyView {
//            switch $viewModel.flag {
//            case .notRequested:
//                return AnyView(notRequestedView)
//            case .isLoading:
//                return AnyView(loadingView)
//    //        case let .loaded(details):
//    //            return AnyView(loadedView(country: viewModel.country, details: details))
//            case let .failed(error):
//                return AnyView(failedView(error))
//            }
//        }
    var notRequestedView : some View{
        Text("no request tt").onAppear(){
            print("--no request--")
        }
    }
    
    var loadingView : some View{
        VStack{
            Button(action: {
                print("click")
            }, label: { Text("Cancel loading") })
        }
    }
    
    func failedView(_ error: Error) -> some View {
        ErrorView(error: error, retryAction: {
            self.viewModel.requestSubmiterList()
        })
    }
}
