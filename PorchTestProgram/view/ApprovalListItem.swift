//
//  ApprovalListItem.swift
//  PorchTestProgram
//
//  Created by Elliott on 2021/1/5.
//  Copyright © 2021 ElliottTest. All rights reserved.
//

import SwiftUI


struct ApprovalListItem: View {
    
    var listItem : ApprovalEntry
    
    var body: some View {
        VStack(alignment: .leading){
            Group{
                HStack{
                    Text(listItem.flowName).frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: colorWhite))
                        .font(.system(size: 14))
                        .lineLimit(1)
                    
                    Text(listItem.flowCode).foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                        .lineLimit(1)
                    Spacer()
                    Text("\(listItem.dateTrans)")
                        .foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                        .lineLimit(1)
                } .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Divider().background(Color(hex: color3c3c))
            }
            Group{
                if listItem.infoList.count > 0{
                    HStack{
                        //                        Text("\(listItem.infoList[0].operateType)")
                        Text(listItem.committerLabel)
                            .frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                            .font(.system(size: 14))
                            .lineLimit(1)
                        //                        Text("\(listItem.infoList[0].operateRoleName) \(listItem.infoList[0].operateName)")
                        Text(listItem.committer)
                            .foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }else if listItem.infoList.count > 1 {
                    HStack{
                        Text("\(listItem.infoList[1].operateType)").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                            .font(.system(size: 14))
                            .lineLimit(1)
                        Text("\(listItem.infoList[1].operateRoleName) \(listItem.infoList[1].operateName)").foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }else if listItem.infoList.count > 2 {
                    HStack{
                        Text("\(listItem.infoList[2].operateType)").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                            .font(.system(size: 14))
                            .lineLimit(1)
                        Text("\(listItem.infoList[2].operateRoleName) \(listItem.infoList[2].operateName)").foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
                
                
                
                
                HStack{
                    Text("客户姓名").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                        .font(.system(size: 14))
                        .lineLimit(1)
                    Text(listItem.customerName).foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                HStack{
                    Text("BP-ID").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                        .font(.system(size: 14))
                        .lineLimit(1)
                    Text(listItem.bpId).foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                HStack{
                    Text("车型 ").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                        .font(.system(size: 14))
                        .lineLimit(1)
                    
                    Text(listItem.carType).foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                if listItem.flowType == 6 {
                    HStack{
                        Text("暂留时长").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                            .font(.system(size: 14))
                            .lineLimit(1)
                        
                        Text("91小时").foregroundColor(Color(hex: color999)) .font(.system(size: 14))
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    
                } else if listItem.flowType == 1{
                    
                }else if listItem.flowType == 3{
                    
                }else{
                    HStack{
                        Text("更新内容").frame(width: 89, height: 22, alignment: .leading).foregroundColor(Color(hex: color999))
                            .font(.system(size: 14))
                            .lineLimit(1)
                        
                        Text("销售顾问提交了91份附加协议待审批") .font(.system(size: 14))
                            
                            .foregroundColor(Color(hex: color999))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                
                
            }
            Group{
                Divider().background(Color(hex: color3c3c)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    if listItem.isHistory == 1 {
                        if listItem.currentStepStatus == 2 {
                            Text("已通过").foregroundColor(Color.green).font(.system(size: 14))
                        }
                        else if listItem.currentStepStatus == 3 {
                            Text("已驳回").foregroundColor(Color.red).font(.system(size: 14))
                        }else if listItem.currentStepStatus == 1 {
                            Text("审批中").foregroundColor(Color.blue).font(.system(size: 14))
                        }else if listItem.currentStepStatus == 5 {
                            Text("已撤回").foregroundColor(Color.blue).font(.system(size: 14))
                        }else {
                            Text("").foregroundColor(Color.blue).font(.system(size: 14))
                        }
                        
                    }
                    Spacer()
                    Text("车辆成交价\(listItem.saleTotalPrice)").foregroundColor(Color(hex: colorWhite))
                        .font(.system(size: 14))
                        
                        .lineLimit(1)
                    Image(systemName: "star").foregroundColor(Color(hex: colorWhite))
                    
                    
                    
                }
            }
            
        }
        .padding(EdgeInsets(top: 12, leading: 14, bottom: 12, trailing: 17))
        .background(Color(hex: color1a2))
    }
}

//struct ApprovalListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ApprovalListItem()
//    }
//}
