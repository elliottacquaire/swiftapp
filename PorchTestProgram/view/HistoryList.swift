//
//  HistoryList.swift
//  PorchTestProgram
//
//  Created by Elliott on 2021/1/5.
//  Copyright © 2021 ElliottTest. All rights reserved.
//

import SwiftUI

struct HistoryList: View {
    
    @ObservedObject var viewModel = BackLogRequestManager()
    
    var body: some View {
        VStack {
            List(viewModel.historyListModel.resources,id: \.id) { landmark in
                NavigationLink(destination: ApprovalDetail()){
                    
                    ApprovalListItem(listItem: landmark)
                }
            } .listStyle(GroupedListStyle())
                .navigationBarTitle("")
                .onAppear(){
                    print("his view start appear")
                    var request = BackLogRequestData()
                    request.currentStepStatus = 1
                    request.stepAction = 1
                    request.isHistory = 1
                    request.flowType = 2
                    self.viewModel.requestApprovalHistoryList(requestData: request)
            }
            //            content
            Spacer()
        }
    }
}

struct HistoryList_Previews: PreviewProvider {
    static var previews: some View {
        HistoryList()
    }
}
